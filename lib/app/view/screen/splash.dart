import 'package:errandmate/app/utils/constant/app.images/app.images.dart';
import 'package:errandmate/app/viewmodel/provider/intitution/institution.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../helper/router.dart';
import '../widget/action.button.dart';
import '../widget/global.dialog.dart';

class AppSplash extends ConsumerStatefulWidget {
  const AppSplash({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppSplashState();
}

class _AppSplashState extends ConsumerState<AppSplash>
    with ViewRouter, GlobalDialog {
  @override
  Widget build(BuildContext context) {
    final fetchInstitution = ref.watch(institutionNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: fetchInstitution.isLoading
                  ? Image.asset(
                      AppImages.logo,
                      width: 100,
                      height: 100,
                    )
                  : null,
            ),
          ),
          if (!fetchInstitution.isLoading)
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: AnimatedContainer(
                duration: const Duration(seconds: 3),
                curve: Curves.fastOutSlowIn,
                child: Opacity(
                  opacity: !fetchInstitution.isLoading ? 1 : 0,
                  child: AppActionButton(
                    text: 'Reload',
                    onPressed: () {
                      ref.invalidate(institutionNotifierProvider);
                    },
                    isLoading: false,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

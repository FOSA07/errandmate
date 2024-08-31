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

class _AppSplashState extends ConsumerState<AppSplash> with ViewRouter, GlobalDialog {

  @override
  Widget build(BuildContext context) {
    final fetchInstitution = ref.watch(institutionNotifierProvider);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: fetchInstitution.isLoading ? const CircularProgressIndicator() : null
            ),
          ),

          if(!fetchInstitution.isLoading) Padding(
            padding: const EdgeInsets.all(18.0),
            child: AnimatedContainer(
              duration: const Duration(seconds: 3),
              curve: Curves.fastOutSlowIn,
              child: Opacity(
                opacity: !fetchInstitution.isLoading ? 1 : 0,
                child: AppActionButton(
                  text: 'Reload',
                  onPressed: () {
                    // listener();
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
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../viewmodel/provider/featuresviewcontroller/errands.controller.dart';
import '../components/errand.bar.chip.dart';
import '../components/home.appbar.dart';
import '../helper/errand.nav.element.dart';

class ErrandsPage extends ConsumerStatefulWidget {
  const ErrandsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ErrandsPageState();
}

class _ErrandsPageState extends ConsumerState<ErrandsPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeAppBar(),
        const SizedBox(height: 10,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                ErrandNavElement.value.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: TabBarChip(
                        text: ErrandNavElement.value[index].text,
                        onPressed: () => 
                          ref.read(errandsPageControllerNotifierProvider.notifier).setIndex = index,
                        isCurrent: ref.watch(errandsPageControllerNotifierProvider) == index,
                      ),
                  ),
                    
                  ),
            ],
          ),
        ),
        const SizedBox(height: 20,),
        Expanded(
          child: ErrandNavElement.value[
            ref.watch(errandsPageControllerNotifierProvider)].widget
        )
      ],
    );
  }
}
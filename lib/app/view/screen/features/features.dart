import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../viewmodel/provider/featuresviewcontroller/bottom.nav.control.dart';
import 'components/bottom.nav.item.box.dart';
import 'helper/bottom.nav.element.dart';

class Features extends ConsumerStatefulWidget {
  const Features({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FeaturesState();
}

class _FeaturesState extends ConsumerState<Features> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavItem(
                current: ref.watch(bottomNavIndexNotifierProvider) == 0,
                name: NavElement.home.name,
                svgIconPath: NavElement.home.icon,
                identifier: const Key('0'),
                onPressed: () => ref.read(bottomNavIndexNotifierProvider.notifier).setIndex = 0,
              ),
              BottomNavItem(
                current: ref.watch(bottomNavIndexNotifierProvider) == 1,
                name: NavElement.errands.name,
                svgIconPath: NavElement.errands.icon,
                identifier: const Key('1'),
                onPressed: () => ref.read(bottomNavIndexNotifierProvider.notifier).setIndex = 1
              ),
              BottomNavItem(
                current: ref.watch(bottomNavIndexNotifierProvider) == 2,
                name: NavElement.messaage.name, 
                svgIconPath: NavElement.messaage.icon,
                identifier: const Key('2'),
                onPressed: () => ref.read(bottomNavIndexNotifierProvider.notifier).setIndex = 2
              ),
              BottomNavItem(
                current: ref.watch(bottomNavIndexNotifierProvider) == 3,
                name: NavElement.profile.name, 
                svgIconPath: NavElement.profile.icon,
                identifier: const Key('3'),
                onPressed: () => ref.read(bottomNavIndexNotifierProvider.notifier).setIndex = 3
              ),
              
            ],
          ),
        ),
      ),

      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0, bottom: 18.0),
            child: NavElement.value[ref.watch(bottomNavIndexNotifierProvider)].widget,
          ),
        )),
    );
  }
}
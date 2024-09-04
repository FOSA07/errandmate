import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/errand.bar.chip.dart';
import 'components/home.appbar.dart';

class ErrandsPage extends ConsumerStatefulWidget {
  const ErrandsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ErrandsPageState();
}

class _ErrandsPageState extends ConsumerState<ErrandsPage> {

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeAppBar(),
        SizedBox(height: 10,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              TabBarChip(text: 'Laundry'),
              SizedBox(width: 10,),
              TabBarChip(text: 'Pickup'),
              SizedBox(width: 10,),
              TabBarChip(text: 'Indoor'),
              SizedBox(width: 10,),
              TabBarChip(text: 'Outdoor'),
            ],
          ),
        )
      ],
    );
  }
}
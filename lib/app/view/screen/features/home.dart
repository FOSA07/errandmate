import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/available.errand.dart';
import 'components/home.appbar.dart';
import 'components/ongoing.errand.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeAppBar(),
        Text("Ongoing Errand",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10,),
        const OngoingErrandContainer(
          name: "Dr Imran Syahir", 
          errandStatus: 'pick up', 
          date: '2024-01-01', 
          location: 'lorem ipsum lorem ipsum lorem ipsum'
        ),
        const SizedBox(height: 25,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Available Errands",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
            ),  
          ],
        ),
        const SizedBox(height: 10,),
        Expanded(
          child: ListView(
            children: List.generate(7, (index) => const Column(
              children: [
                AvailableErrandContainer(
                  errandStatus: "Pick up",
                  position: "General Director",
                  date: '2024-01-01',
                  price: '2500',
                ),
                SizedBox(height: 15,),
              ],
            ),
            ),
          )
        )
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          color: Colors.red,
          padding: const EdgeInsets.all(10),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
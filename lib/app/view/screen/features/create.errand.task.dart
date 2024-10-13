import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateErrandTask extends ConsumerStatefulWidget {
  const CreateErrandTask({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateErrandTaskState();
}

class _CreateErrandTaskState extends ConsumerState<CreateErrandTask> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0, bottom: 18.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create Task',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                ],)
              ],
            ),
          ),
        )
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../viewmodel/provider/errands/create.errand.task.dart';
import '../../../viewmodel/provider/errands/form/create.outdoor.dart';
import '../../../viewmodel/provider/errands/form/create.pickup.form.dart';
import '../../widget/action.button.dart';
import '../../widget/dropdown.dart';
import 'errands/create/outdoor.dart';
import 'errands/create/pickup.dart';

class CreateErrandTask extends ConsumerStatefulWidget {
  const CreateErrandTask({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateErrandTaskState();
}

class _CreateErrandTaskState extends ConsumerState<CreateErrandTask> {

  ValueNotifier<String> current = ValueNotifier<String>("");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0, bottom: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create Task',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                ],),
                const SizedBox(height: 20,),
                const Text(
                  'Select Errand Type'
                ),
                const SizedBox(height: 10,),
                DropDownField(
                  labelText: "",
                  hintText: "Errand Type",
                  dropDownValueModel: const [],
                  dropDownValues: const ["Pick up", "Laundry", "Outdoor", "Indoor"],
                  onChanged: (p0) => 
                    current.value = p0.runtimeType == String ? "" : p0.name.toString(),
                  // onChanged: (p0) => print(p0.runtimeType)

                  // onChanged: (p0) => accountForm
                  //     .updateGender(p0.name.toString().trim()),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: ValueListenableBuilder(
                      valueListenable: current,
                      builder: (context, value, child) {
                        return current.value == "Pick up" ? 
                          CreatePickup() : current.value == "Outdoor" ? const CreateOutdoor() : const Text("No Errand Type Selected");
                      },
                    ),
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) => AppActionButton(
                    text: 'Create',
                    onPressed: () {
                      if(current.value == "Pick up"){
                        final form = ref.watch(createPickupFormNotifierProvider.notifier);
                        if(form.formKey.currentState!.validate()){
                          // print(ref.read(createPickupFormNotifierProvider));
                          Map<String, dynamic> map = ref.read(createPickupFormNotifierProvider);
                          print(map);

                          ref.read(createErrandTaskNotifierProvider.notifier)
                            .createTask("pickup", map);
                        }
                      } else if(current.value == "Outdoor"){
                        final form = ref.watch(createOutdoorFormNotifierProvider.notifier);
                        if(form.formKey.currentState!.validate()){
                          // print(ref.read(createPickupFormNotifierProvider));
                          Map<String, dynamic> map = ref.read(createOutdoorFormNotifierProvider);
                          print(map);

                          ref.read(createErrandTaskNotifierProvider.notifier)
                            .createTask("outdoor", map);
                        }
                      }
                    },
                    isLoading: ref.watch(createErrandTaskNotifierProvider).isLoading,
                    
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
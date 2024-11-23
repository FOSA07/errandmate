import 'package:errandmate/app/view/screen/features/components/custom.keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/constant/app.colors/app.colors.dart';
import '../../../viewmodel/provider/wallet/deposit.dart';
import '../../widget/action.button.dart';
import '../../widget/text.form.field.dart';

class Wallet extends ConsumerWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController amountController = TextEditingController();
    final formkey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0, bottom: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Wallet',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                ],),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Total Balance"),
                    const SizedBox(width: 5),
                    GestureDetector(
                      child: const Icon(Icons.visibility_off, size: 15,)
                    )
                  ]
                ),
                const SizedBox(height: 10,),
                Text(
                  "00.00",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 30
                  ),
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        // showCustomBottomSheet(context);
                        showModalBottomSheet(
                          context: context, 

                          isScrollControlled: true,
                            builder: (context) => SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: IntrinsicHeight(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Form(
                                        key: formkey,
                                        child: AppTextFormField(
                                          controller: amountController,
                                          labelText: 'Amount(₦)',
                                          keyboardType: TextInputType.number,
                                          readOnly: true,
                                          validator: (p0) => p0 != null && p0.isEmpty ? "Field cannot be empty" : null,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      CustomKeyboardExample(controller: amountController),
                                      const SizedBox(height: 20),
                                      Consumer(
                                        builder: (context, ref, child) => AppActionButton(
                                          text: 'Pay',
                                          onPressed: () {
                                            if(formkey.currentState!.validate()){
                                              ref.read(depositNotifierProvider.notifier)
                                                  .pay(amount: amountController.text);
                                            }
                                            
                                          },
                                          isLoading: ref.watch(depositNotifierProvider).isLoading,
                                          
                                        ),
                                      )
                                    ]
                                  )
                                )
                              )
                            )
                        );
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.blue1,
                            child: const Icon(Icons.add, color: Colors.white,),
                          ),
                          const SizedBox(height: 5,),
                          const Text("Deposit")
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.blue1,
                          child: const Icon(Icons.money_off, color: Colors.white,),
                        ),
                        const SizedBox(height: 5,),
                        const Text("Withdraw")
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.blue1,
                          child: const Icon(Icons.support_agent, color: Colors.white,),
                        ),
                        const SizedBox(height: 5,),
                        const Text("Support")
                      ],
                    )
                  ]
                )
                
              ]
            )
          )
        )
      )
    );
  }

  void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Critical for accommodating keyboard
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.4, // Start height (40% of the screen)
          minChildSize: 0.3, // Minimum height
          maxChildSize: 0.9, // Maximum height (adjust as needed)
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    "Enter Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Handle form submission
                      Navigator.pop(context);
                    },
                    child: const Text("Submit"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

}
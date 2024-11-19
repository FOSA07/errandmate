import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterwave_standard_smart/flutterwave.dart';

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
                    Text("Total Balance"),
                    const SizedBox(width: 5),
                    GestureDetector(
                      child: Icon(Icons.visibility_off, size: 15,)
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
                        showModalBottomSheet(
                          context: context, 
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
                                          validator: (p0) => p0 != null && p0.isEmpty ? "Field cannot be empty" : null,
                                        ),
                                      ),
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
                            child: Icon(Icons.add, color: Colors.white,),
                            backgroundColor: AppColors.blue1,
                          ),
                          const SizedBox(height: 5,),
                          Text("Deposit")
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.money_off, color: Colors.white,),
                          backgroundColor: AppColors.blue1,
                        ),
                        const SizedBox(height: 5,),
                        Text("Withdraw")
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.support_agent, color: Colors.white,),
                          backgroundColor: AppColors.blue1,
                        ),
                        const SizedBox(height: 5,),
                        Text("Support")
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
}
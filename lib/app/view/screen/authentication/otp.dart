import 'package:flutter/material.dart';

import '../../widget/action.button.dart';
import '../../widget/auth.text.headers.dart';
import 'component/otp.row.dart';

class OTP extends StatelessWidget {
  const OTP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forget Password',
          style: Theme.of(context).textTheme.titleSmall  
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const AuthTextHeader(
                      text: 'OTP Verification',
                    ),
                    const SizedBox(height: 15,),
                    const Text('A verification code has been sent to ...'),
                    const SizedBox(height: 25,),
                    OTPRow(
                      onCompleted: (otp) {
                        // print('OTP Entered: $otp');
                      },
                    ),
                  ],
                ),
              ),
            ),
            AppActionButton(
              text: 'Continue',
              onPressed: (){},
              isLoading: false,
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../../../utils/constant/app.colors/app.colors.dart';
import '../../widget/action.button.dart';
import '../../widget/auth.text.headers.dart';

class OTP extends StatelessWidget {
  const OTP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: const Text('Forget Password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    AuthTextHeader(
                      text: 'OTP Verification',
                    ),
                    SizedBox(height: 15,),
                    Text('A verification code has been sent to ...'),
                    SizedBox(height: 25,),
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
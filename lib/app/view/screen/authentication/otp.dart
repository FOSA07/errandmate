
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../viewmodel/provider/authentication/otp.dart';
import '../../widget/action.button.dart';
import '../../widget/auth.text.headers.dart';
import 'component/otp.row.dart';

class OTP extends ConsumerWidget {
  final String token;
  final String uid;
  final bool isForgetPassword;
  OTP({
    super.key,
    required this.token,
    required this.uid,
    required this.isForgetPassword,
  });

  ValueNotifier<String> otpValue = ValueNotifier('');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('',
            style: Theme.of(context).textTheme.displaySmall),
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
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('A verification code has been sent to ...'),
                    const SizedBox(
                      height: 25,
                    ),
                    OTPRow(
                      onCompleted: (otp) {
                        otpValue.value = otp;
                        // print('OTP Entered: $otp');
                      },
                    ),
                  ],
                ),
              ),
            ),
            AppActionButton(
              text: 'Continue',
              onPressed: () {
                if (otpValue.value.length == 7) {
                  ref.read(oTPNotifierProvider.notifier).verifyOTP(
                        tkn: token,
                        uid: uid,
                        code: otpValue.value,
                        isFgtPassword: isForgetPassword,
                      );
                }
              },
              isLoading: ref.watch(oTPNotifierProvider).isLoading,
            )
          ],
        ),
      ),
    );
  }
}

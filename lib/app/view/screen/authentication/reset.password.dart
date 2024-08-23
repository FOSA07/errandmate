import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widget/action.button.dart';
import '../../widget/auth.text.headers.dart';
import '../../widget/text.form.field.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
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
                      text: 'Reset Password',
                    ),
                    const SizedBox(height: 15,),
                    const Text('Enter your registered email for registration'),
                    const SizedBox(height: 25,),
                    AppTextFormField(
                      controller: _email,
                      labelText: 'Email Address',
                    ),
                  ],
                ),
              ),
            ),
            AppActionButton(
              text: 'Continue',
              onPressed: () => context.push('/auth/otp'),
              isLoading: false,
            )
          ],
        ),
      ),
    );
  }
}
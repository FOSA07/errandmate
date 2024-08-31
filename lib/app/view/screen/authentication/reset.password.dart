import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widget/action.button.dart';
import '../../widget/auth.text.headers.dart';
import '../../widget/text.form.field.dart';
import 'helper/validator.dart';

class ResetPassword extends StatelessWidget with Validators {
  ResetPassword({super.key});

  final TextEditingController _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forget Password',
          style: Theme.of(context).textTheme.displaySmall
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
                      text: 'Reset Password',
                    ),
                    const SizedBox(height: 15,),
                    const Text('Enter your registered email for registration'),
                    const SizedBox(height: 25,),
                    Form(
                      key: _formKey,
                      child: AppTextFormField(
                        controller: _email,
                        labelText: 'Email Address',
                        keyboardType: TextInputType.emailAddress,
                        validator: validateEmail,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppActionButton(
              text: 'Continue',
              onPressed: () { 
                if(_formKey.currentState!.validate()){
                  context.push('/auth/pin-changed');
                }
              },
              isLoading: false,
            )
          ],
        ),
      ),
    );
  }
}
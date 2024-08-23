import 'package:errandmate/app/utils/constant/app.colors/app.colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widget/action.button.dart';
import '../../widget/auth.text.headers.dart';
import '../../widget/text.form.field.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: const Text('Login'),
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
                      text: 'Login to your\nBillpoint account',
                    ),
                    const SizedBox(height: 15,),
                    RichText(
                      
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                          color: AppColors.black
                        ),
                        children: [
                          TextSpan(
                            text: 'Create account',
                            style: TextStyle(
                              color: AppColors.grey1,
                              fontWeight: FontWeight.bold
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () => context.push('/auth/create-account'),
                          )
                        ]
                      ),
                    ),
                    const SizedBox(height: 25,),
                    AppTextFormField(
                      controller: _email,
                      labelText: 'Email Address',
                    ),
                    const SizedBox(height: 20,),
                    AppTextFormField(
                      controller: _password,
                      labelText: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      suffixIcon: Icon(Icons.remove_red_eye, color: AppColors.grey1,),
                    ),
                    const SizedBox(height: 30,),
                    RichText(
                      
                      text: TextSpan(
                        text: "Forgot password? ",
                        style: TextStyle(
                          color: AppColors.black
                        ),
                        children: [
                          TextSpan(
                            text: 'Reset',
                            style: TextStyle(
                              color: AppColors.grey1,
                              fontWeight: FontWeight.bold
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () => context.go('/auth/reset-password'),
                          )
                        ]
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppActionButton(
              text: 'Login',
              onPressed: (){},
              isLoading: false,
            )
          ],
        ),
      ),
    );
  }
}
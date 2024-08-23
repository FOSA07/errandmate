import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/constant/app.colors/app.colors.dart';
import '../../widget/action.button.dart';
import '../../widget/auth.text.headers.dart';
import '../../widget/text.form.field.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});

  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _middlename = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: const Text('Create Account'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      const AuthTextHeader(
                        text: 'Experience a new vibe\nof bill payments.',
                      ),
                      const SizedBox(height: 15,),
                      RichText(
                        
                        text: TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                            color: AppColors.black
                          ),
                          children: [
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                color: AppColors.grey1,
                                fontWeight: FontWeight.bold
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () => context.go('/auth'),
                            )
                          ]
                        ),
                      ),
                      const SizedBox(height: 25,),
                      AppTextFormField(
                        controller: _firstname,
                        labelText: 'First Name',
                      ),
                      const SizedBox(height: 20,),
                      AppTextFormField(
                        controller: _middlename,
                        labelText: 'Middle Name (optional)',
                      ),
                      const SizedBox(height: 20,),
                      AppTextFormField(
                        controller: _lastname,
                        labelText: 'Last Name',
                      ),
                      const SizedBox(height: 20,),
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
                      const SizedBox(height: 20,),
                      AppTextFormField(
                        controller: _confirmPassword,
                        labelText: 'Confirm Password',
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        suffixIcon: Icon(Icons.remove_red_eye, color: AppColors.grey1,),
                      ),
                      const SizedBox(height: 30,),
                      const Text('''By proceeding, you agree to our Terms of Service and Privacy Policy'''),
                      const SizedBox(height: 35,)
                    ],
                  ),
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
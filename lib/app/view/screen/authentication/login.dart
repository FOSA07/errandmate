import 'package:errandmate/app/utils/constant/app.colors/app.colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widget/action.button.dart';
import '../../widget/auth.text.headers.dart';
import '../../widget/text.form.field.dart';
import 'helper/validator.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with Validators {
  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> _obscureText = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
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
                      text: 'Login to your account',
                    ),
                    const SizedBox(height: 15,),
                    RichText(
                      
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: 'Create account',
                            style: TextStyle(
                              color: AppColors.grey1,
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () => context.push('/auth/create-account'),
                          )
                        ]
                      ),
                    ),
                    const SizedBox(height: 25,),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AppTextFormField(
                            controller: _email,
                            labelText: 'Email Address',
                            validator: validateEmail,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 20,),
                          ValueListenableBuilder(
                            valueListenable: _obscureText,
                            builder: (context, value, child) => AppTextFormField(
                                controller: _password,
                                labelText: 'Password',
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: _obscureText.value,
                                suffixIcon: InkWell(
                                  onTap: () => _obscureText.value = !_obscureText.value,
                                  child: Icon(
                                    _obscureText.value ? Icons.remove_red_eye : Icons.visibility_off,
                                    color: _obscureText.value ? AppColors.grey1 : AppColors.primary,
                                  )
                                ),
                                validator: validatePassword,
                              )
                          ),
                        ]
                      )
                    ),
                    
                    const SizedBox(height: 30,),
                    RichText(
                      
                      text: TextSpan(
                        text: "Forgot password? ",
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: 'Reset',
                            style: TextStyle(
                              color: AppColors.grey1,
                              fontWeight: FontWeight.bold,
                              fontSize: 12
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
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  print('done');
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
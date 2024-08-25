import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/constant/app.colors/app.colors.dart';
import '../../widget/action.button.dart';
import '../../widget/auth.text.headers.dart';
import '../../widget/text.form.field.dart';
import 'helper/validator.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> with Validators {

  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _middlename = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _email = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _obscureConfirmPassword = ValueNotifier<bool>(true);

  @override
  void dispose() {

    _firstname.dispose();
    _middlename.dispose();
    _lastname.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    _email.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Account',
          style: Theme.of(context).textTheme.titleSmall
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.7,
                          child: Column(
                            children: [
                              const AuthTextHeader(
                                text: 'Experience a new vibe of running errands.',
                              ),
                              const SizedBox(height: 15,),
                              RichText(
                                
                                text: TextSpan(
                                  text: "Already have an account? ",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  children: [
                                    TextSpan(
                                      text: 'Login',
                                      style: TextStyle(
                                        color: AppColors.grey1,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12
                                      ),
                                      recognizer: TapGestureRecognizer()..onTap = () => context.go('/auth'),
                                    )
                                  ]
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25,),
                        AppTextFormField(
                          controller: _firstname,
                          labelText: 'First Name',
                          validator: validateName,
                        ),
                        const SizedBox(height: 20,),
                        AppTextFormField(
                          controller: _middlename,
                          labelText: 'Middle Name (optional)',
                          validator: validateName,
                        ),
                        const SizedBox(height: 20,),
                        AppTextFormField(
                          controller: _lastname,
                          labelText: 'Last Name',
                          validator: validateName,
                        ),
                        const SizedBox(height: 20,),
                        AppTextFormField(
                          controller: _email,
                          labelText: 'Email Address',
                          validator: validateEmail,
                        ),
                        const SizedBox(height: 20,),
                        ValueListenableBuilder(
                          valueListenable: _obscurePassword,
                          builder: (context, value, child) => AppTextFormField(
                              controller: _password,
                              labelText: 'Password',
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: _obscurePassword.value,
                              suffixIcon: InkWell(
                                onTap: () => _obscurePassword.value = !_obscurePassword.value,
                                child: Icon(
                                  _obscurePassword.value ? Icons.remove_red_eye : Icons.visibility_off,
                                  color: _obscurePassword.value ? AppColors.grey1 : AppColors.primary,
                                )
                              ),
                              validator: validatePassword,
                            )
                        ),
                        const SizedBox(height: 20,),
                        ValueListenableBuilder(
                          valueListenable: _obscureConfirmPassword,
                          builder: (context, value, child) => AppTextFormField(
                              controller: _confirmPassword,
                              labelText: 'Confirm Password',
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: _obscureConfirmPassword.value,
                              suffixIcon: InkWell(
                                onTap: () => _obscureConfirmPassword.value = !_obscureConfirmPassword.value,
                                child: Icon(
                                  _obscureConfirmPassword.value ? Icons.remove_red_eye : Icons.visibility_off,
                                  color: _obscureConfirmPassword.value ? AppColors.grey1 : AppColors.primary,
                                )
                              ),
                              validator: (p0) => _password.text == _confirmPassword.text ?
                                null : 'Password doesn\'t match',
                            )
                        ),
                        const SizedBox(height: 30,),
                        Text('''By proceeding, you agree to our Terms of Service and Privacy Policy''',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 35,)
                      ],
                    ),
                  ),
                ),
              ),
              AppActionButton(
                text: 'Continue',
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
      ),
    );
  }
}
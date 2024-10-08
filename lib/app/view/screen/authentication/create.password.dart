import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../viewmodel/provider/authentication/create.password.dart';
import '../../widget/action.button.dart';
import '../../widget/auth.text.headers.dart';
import '../../widget/text.form.field.dart';
import 'helper/validator.dart';
class CreatePassword extends StatefulWidget {
  final String hashValue;
  final String uid;
  const CreatePassword({super.key, required this.hashValue, required this.uid});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> with Validators {
  final List<TextEditingController> _controllers = List.generate(3, (_) => TextEditingController());
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: Theme.of(context).textTheme.displaySmall
        ),
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
                        text: 'Create Password',
                      ),
                      const SizedBox(height: 15,),
                      const Text('Create a new password for your account'),
                      const SizedBox(height: 25,),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // AppTextFormField(
                            //   controller: _controllers[0],
                            //   labelText: 'Enter Old Password',
                            //   keyboardType: TextInputType.visiblePassword,
                            //   obscureText: true,
                            //   validator: validatePassword,
                            // ),
                            // const SizedBox(height: 20,),
                            AppTextFormField(
                              controller: _controllers[1],
                              labelText: 'Enter New Password',
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              validator: validatePassword,
                            ),
                            const SizedBox(height: 20,),
                            AppTextFormField(
                              controller: _controllers[2],
                              labelText: 'Confirm New Password',
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              validator: (p0) => _controllers[2].text.isEmpty
                                ? 'Please enter a password'
                                : _controllers[1].text == _controllers[2].text
                                    ? null
                                    : 'Password doesn\'t match',
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 30,),
                    ],
                  ),
                ),
              ),
            ),
            Consumer(
              builder: (context, ref, child) => AppActionButton(
                text: 'Continue',
                onPressed: () { 
                  if(_formKey.currentState!.validate()){
                    // context.push('/auth/pin-changed');
                    ref.read(createPasswordNotifierProvider.notifier).createNewPassword(
                      hash: widget.hashValue,
                      uid: widget.uid,
                      newPassword: _controllers[2].text
                    );
                  }
                },
                isLoading: ref.watch(createPasswordNotifierProvider).isLoading,
              ),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widget/action.button.dart';
import '../../widget/auth.text.headers.dart';
import '../../widget/text.form.field.dart';

class CreatePassword extends StatelessWidget {
  CreatePassword({super.key});

  final List<TextEditingController> _controllers = List.generate(3, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
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
                      text: 'Create Password',
                    ),
                    const SizedBox(height: 15,),
                    const Text('Create a new password for your account'),
                    const SizedBox(height: 25,),
                    AppTextFormField(
                      controller: _controllers[0],
                      labelText: 'Enter Old Password',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    const SizedBox(height: 20,),
                    AppTextFormField(
                      controller: _controllers[1],
                      labelText: 'Enter New Password',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    const SizedBox(height: 20,),
                    AppTextFormField(
                      controller: _controllers[2],
                      labelText: 'Confirm New Password',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    const SizedBox(height: 30,),
                  ],
                ),
              ),
            ),
            AppActionButton(
              text: 'Continue',
              onPressed: () => context.push('/auth/pin-changed'),
              isLoading: false,
            )
          ],
        ),
      ),
    );
  }
}
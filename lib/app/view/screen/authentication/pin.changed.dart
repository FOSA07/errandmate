import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widget/action.button.dart';
import '../../widget/auth.text.headers.dart';

class PinChanged extends StatelessWidget {
  const PinChanged({super.key});

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
            const Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthTextHeader(
                      text: 'Pin Created',
                    ),
                    SizedBox(height: 15,),
                    Text('Congratulations! Enjoy the new way of expressing love.'),
                    SizedBox(height: 25,),
                  ],
                ),
              ),
            ),
            AppActionButton(
              text: 'Continue',
              onPressed: () => context.push('/auth'),
              isLoading: false,
            )
          ],
        ),
      ),
    );
  }
}
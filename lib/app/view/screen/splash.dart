import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppSplash extends StatelessWidget {
  const AppSplash({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 1), () => context.go('/errandmate'));

    return const Scaffold(
      body: Center(
        
      ),
    );
  }
}
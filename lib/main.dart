import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'app/utils/serviceLocator/service.locator.dart';
import 'app/utils/constant/app.theme/text.theme.dart';

void main() {
  
  setUpLocator();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _routes = locator<GoRouter>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));
    
    return MaterialApp.router(
      routerConfig: _routes,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        fontFamily: 'PR',
        textTheme: appTextTheme
      ),
    );
  }
}
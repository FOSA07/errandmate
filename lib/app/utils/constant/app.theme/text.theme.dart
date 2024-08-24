import 'package:flutter/material.dart';

import '../app.colors/app.colors.dart';

TextTheme appTextTheme = TextTheme(
  titleSmall: const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    fontFamily: 'PB',
  ),
  
  titleLarge: const TextStyle(
    fontFamily: 'PEB',
    fontSize: 30,
    color: Colors.white
  ),
  headlineMedium: const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    fontFamily: 'PB',
  ),
  bodyMedium: const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    fontFamily: 'PR'
  ),
  bodySmall: TextStyle(
    fontFamily: 'PR',
    fontWeight: FontWeight.w400,
    fontSize: 10,
    color: AppColors.grey3
  ),
);
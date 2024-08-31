import 'package:flutter/material.dart';

class AuthTextHeader extends StatelessWidget {

  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  const AuthTextHeader({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w900,
    this.fontSize = 18,
    this.textAlign = TextAlign.center
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w600)
    );
  }
}
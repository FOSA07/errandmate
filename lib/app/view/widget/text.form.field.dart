import 'package:flutter/material.dart';

import '../../utils/constant/app.colors/app.colors.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;
  final bool enabled;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  
  const AppTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText = '',
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.enabled = true,
    this.textInputAction,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 55,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        onChanged: onChanged,
        maxLength: maxLength,
        enabled: enabled,
        textInputAction: textInputAction,
        focusNode: focusNode,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelStyle: Theme.of(context).textTheme.bodySmall,
          isDense: true,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              color: AppColors.grey2
            )
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: AppColors.white3
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: AppColors.white3
            )
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: AppColors.progress
            )
          ),
        ),
      ),
    );
  }
}

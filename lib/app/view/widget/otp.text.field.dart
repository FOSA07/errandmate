import 'package:errandmate/app/utils/constant/app.colors/app.colors.dart';
import 'package:flutter/material.dart';

class OTPBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool autoFocus;
  final Function(String) onChanged;

  const OTPBox({
    super.key,
    required this.controller,
    required this.focusNode,
    this.autoFocus = false,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        // maxLength: 1,
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        cursorHeight: 12,
        // style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: '',
          contentPadding: const EdgeInsets.all(0),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primary,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
        ),
        onChanged: onChanged,
      ),
    );
  }
}

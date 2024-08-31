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
        // style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.all(0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}

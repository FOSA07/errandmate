import 'package:flutter/material.dart';

import '../../../widget/otp.text.field.dart';

class OTPRow extends StatefulWidget {
  final Function(String) onCompleted;
  const OTPRow({super.key, required this.onCompleted});

  @override
  State<OTPRow> createState() => _OTPRowState();
}

class _OTPRowState extends State<OTPRow> {
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 3) {
        _focusNodes[index].unfocus();
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      } else {
        _focusNodes[index].unfocus();
        widget.onCompleted(_controllers.map((c) => c.text).join());
      }
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: OTPBox(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            autoFocus: index == 0,
            onChanged: (value) => _onChanged(value, index),
          ),
        );
      }),
    );
  }
}
import 'package:flutter/material.dart';

import '../../../widget/otp.text.field.dart';

class OTPRow extends StatefulWidget {
  final Function(String) onCompleted;
  const OTPRow({super.key, required this.onCompleted});

  @override
  State<OTPRow> createState() => _OTPRowState();
}

class _OTPRowState extends State<OTPRow> {
  final List<TextEditingController> _controllers =
      List.generate(7, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(7, (_) => FocusNode());

  void _onChanged(String value, int index) {
    int indexX = index;
    if (value.length > 1) {
      for (int a = 0; a < 7 - indexX; a++) {
        _controllers[index].text = value.characters.elementAt(a);

        index++;
        if (index > 6) index = 6;
      }
    }
    if (value.isNotEmpty) {
      if (index < 6) {
        _focusNodes[index].unfocus();
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      } else {
        _focusNodes[indexX].hasFocus ? _focusNodes[indexX].unfocus() : null;
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
      children: List.generate(7, (index) {
        return Expanded(
          child: AspectRatio(
            aspectRatio: .5,
            child: OTPBox(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              autoFocus: index == 0,
              onChanged: (value) => _onChanged(value, index),
            ),
          ),
        );
      }),
    );
  }
}

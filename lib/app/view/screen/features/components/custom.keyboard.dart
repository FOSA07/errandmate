import 'package:flutter/material.dart';

class CustomKeyboardExample extends StatefulWidget {
  final TextEditingController controller;

  const CustomKeyboardExample({super.key, required this.controller});

  @override
  _CustomKeyboardExampleState createState() => _CustomKeyboardExampleState();
}

class _CustomKeyboardExampleState extends State<CustomKeyboardExample> {
  // final TextEditingController _controller = TextEditingController();

  void _onKeyTapped(String value) {
    setState(() {
      widget.controller.text += value; // Append the digit
    });
  }

  void _onBackspaceTapped() {
    setState(() {
      if (widget.controller.text.isNotEmpty) {
        widget.controller.text =
            widget.controller.text.substring(0, widget.controller.text.length - 1); // Remove last digit
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return NumericKeyboard(
      onKeyTapped: _onKeyTapped,
      onBackspaceTapped: _onBackspaceTapped,
      controller: widget.controller,
    );
  }

  // void _showCustomKeyboard(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     builder: (context) {
  //       return NumericKeyboard(
  //         onKeyTapped: _onKeyTapped,
  //         onBackspaceTapped: _onBackspaceTapped,
  //         controller: widget.controller,
  //       );
  //     },
  //   );
  // }
}

class NumericKeyboard extends StatelessWidget {
  final Function(String) onKeyTapped;
  final VoidCallback onBackspaceTapped;
  final TextEditingController controller;

  const NumericKeyboard({
    Key? key,
    required this.onKeyTapped,
    required this.onBackspaceTapped,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ["1", "2", "3"].map((digit) {
              return _buildKey(digit);
            }).toList(),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ["4", "5", "6"].map((digit) {
              return _buildKey(digit);
            }).toList(),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ["7", "8", "9"].map((digit) {
              return _buildKey(digit);
            }).toList(),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Spacer(),
              ElevatedButton(
                onPressed: controller.clear,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  elevation: 0,
                  padding: const EdgeInsets.all(16),
                ),
                child: const Icon(Icons.clear_rounded),
              ),
              _buildKey("0"),
              ElevatedButton(
                onPressed: onBackspaceTapped,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  elevation: 0,
                  padding: const EdgeInsets.all(16),
                ),
                child: const Icon(Icons.backspace),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildKey(String digit) {
    return ElevatedButton(
      onPressed: () => onKeyTapped(digit),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
      ),
      child: Text(
        digit,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TabBarChip extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const TabBarChip({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Color.fromARGB(255, 234, 233, 233)
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade600
          ),
        ),
      ),
    );
  }
}
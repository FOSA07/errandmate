import 'package:flutter/material.dart';

import '../../../../utils/constant/app.colors/app.colors.dart';

class TabBarChip extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final bool isCurrent;
  const TabBarChip({super.key, required this.text, this.onPressed, required this.isCurrent});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          color: isCurrent? const Color.fromARGB(255, 208, 230, 249) : const Color.fromARGB(255, 234, 233, 233)
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: isCurrent ? AppColors.blue1 : Colors.grey.shade600
          ),
        ),
      ),
    );
  }
}
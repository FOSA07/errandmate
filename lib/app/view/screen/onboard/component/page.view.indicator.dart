import 'package:errandmate/app/utils/constant/app.colors/app.colors.dart';
import 'package:flutter/material.dart';

class PageViewIndicator extends StatelessWidget {
  final bool current;
  const PageViewIndicator({super.key, required this.current});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      height: 10,
      width: current ? 30 : 10,
      decoration: BoxDecoration(
        color: AppColors.white1,
        borderRadius: const BorderRadius.all(Radius.circular(50))
      ),
    );
  }
}
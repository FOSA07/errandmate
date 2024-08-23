import 'package:flutter/material.dart';
import '../../utils/constant/app.colors/app.colors.dart';

class AppActionButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final EdgeInsets? padding;
  final bool fullWidth;
  const AppActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isLoading, 
    this.padding,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: fullWidth ? double.infinity : null,
        padding: padding ?? const EdgeInsets.all(15),
        textColor: isLoading ? AppColors.white3 : AppColors.white1,
        splashColor: isLoading ? AppColors.progress : AppColors.primary,
        color: isLoading ? AppColors.progress : AppColors.primary,
        child: Text(
          text,
        ),
      ),
    );
  }
}
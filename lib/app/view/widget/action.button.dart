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
        textColor: AppColors.white1,
        splashColor: AppColors.primary,
        color:  AppColors.primary,
        child: isLoading ? SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            strokeWidth: 1,
            color: AppColors.white1,
          ),
        ) : Text(
          text,
        ),
      ),
    );
  }
}
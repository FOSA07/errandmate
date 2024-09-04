import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/constant/app.colors/app.colors.dart';

class BottomNavItem extends StatelessWidget {
  final bool current;
  final String name;
  final String svgIconPath;
  final Key identifier;
  final Function()? onPressed;
  const BottomNavItem({super.key, 
    required this.current, 
    required this.name, 
    required this.svgIconPath, 
    required this.identifier, 
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          color: current ? const Color.fromARGB(255, 208, 230, 249) : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
            child: Row(
              children: [
                SvgPicture.asset(
                  svgIconPath,
                  colorFilter: current ? ColorFilter.mode(AppColors.blue1, BlendMode.srcIn) : null,

                ),
                if (current) const SizedBox(width: 5,),
                if (current) Text(
                  name,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color:AppColors.blue1, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
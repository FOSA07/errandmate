import 'package:errandmate/app/utils/constant/app.images/app.images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/constant/app.colors/app.colors.dart';

class OngoingErrandContainer extends StatelessWidget {
  final String name;
  final String errandStatus, date, location;
  const OngoingErrandContainer({super.key, 
    required this.name, 
    required this.errandStatus, 
    required this.date, 
    required this.location
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        color: AppColors.blue1,
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: const CircleAvatar(),
              title: Text(
                name,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.white1
                ),
              ),
              subtitle: Text(
                errandStatus,
                style: TextStyle(
                  color: AppColors.white1
                ),
              ),
              trailing: GestureDetector(
                onTap: (){}, 
                child: Icon(Icons.arrow_forward_ios, color: AppColors.white1,)
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 248, 247, 247),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppImages.calendar,
                          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                        const SizedBox(width: 3,),
                        Expanded(
                          child: Text(
                            date,
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.white1),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Expanded(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppImages.location,
                          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                        const SizedBox(width: 3,),
                        Expanded(
                          child: Text(
                            location,
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.white1),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
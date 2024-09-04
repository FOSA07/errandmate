import 'package:errandmate/app/view/widget/list.tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/constant/app.images/app.images.dart';
import '../../../viewmodel/provider/user/user.profile.dart';
import '../../helper/router.dart';
import 'components/notification.bar.dart';

class Profile extends StatelessWidget with ViewRouter{
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Profile',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                
              ),
            ),
            const NotificationComponent()
          ],
        ),
        const SizedBox(height: 10,),
        
        Expanded(child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final userprofile = ref.watch(userProfileNotifierProvider);
                  return Row(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${userprofile!.firstname} ${userprofile.lastname}',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(userprofile.email),
                          Text(userprofile.phone)
                          
                        ],
                      )
                    ],
                  );
                }
              ),
              const SizedBox(height: 25,),
              Text(
                'Profile Settings',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 237, 236, 236),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                child: Column(
                  children: [
                    AppListTile(
                      iconPath: AppImages.profile, 
                      title: 'My Acount', 
                      subtitle: 'Make changes to your account',
                      onPressed: () => goto('/features/profile/edit'),
                    ),
                    const AppListTile(
                      iconPath: AppImages.profile, 
                      title: 'Transportation', 
                      subtitle: 'Make changes to your account'
                    ),
                    const AppListTile(
                      iconPath: AppImages.profile, 
                      title: 'My Errands', 
                      subtitle: 'Manage your account mode'
                    ),
                  ],
                ),
              ),
    
              const SizedBox(height: 25,),
              Text(
                'More Settings',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 237, 236, 236),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                child: const Column(
                  children: [
                    AppListTile(
                      iconPath: AppImages.profile, 
                      title: 'Change Password', 
                      subtitle: 'Futher secure your account for safety'
                    ),
                    AppListTile(
                      iconPath: AppImages.profile, 
                      title: 'Log out', 
                      subtitle: 'Futher secure your account for safety'
                    ),
                  ],
                ),
              )
            ],
          ),  
        ))
        
        
      ],
    );
  }
}
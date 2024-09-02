import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constant/app.images/app.images.dart';
import '../../helper/router.dart';
import '../../widget/text.form.field.dart';
import '../authentication/helper/validator.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> with ViewRouter, Validators {

  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => back(),
                    child: const Icon(Icons.arrow_back)
                  ),

                  SvgPicture.asset(
                    AppImages.settings,
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [

                                CircleAvatar(
                                  radius: 50,
                                ),
                                Positioned(
                                  child: CircleAvatar(
                                    radius: 4,
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Text('data'),
                            Text('data')
                          ],
                        ),
                      ),
                      
                      Text("Your Email",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      AppTextFormField(
                        controller: _email,
                        hintText: '',
                        
                      )
                    ],
                  ),
                )
              )
            ],
          ),
        )
      ),
    );
  }
}
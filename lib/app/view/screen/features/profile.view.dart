import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constant/app.colors/app.colors.dart';
import '../../../utils/constant/app.images/app.images.dart';
import '../../../viewmodel/provider/user/user.profile.dart';
import '../../helper/router.dart';
import '../../widget/action.button.dart';
import '../../widget/text.form.field.dart';
import '../authentication/helper/validator.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> with ViewRouter, Validators {

  late final TextEditingController _email;
  late final TextEditingController _phone;
  late final TextEditingController _matric;
  late final TextEditingController _password;

  final ValueNotifier<bool> _obscureText = ValueNotifier<bool>(true);

  @override
  void initState() {

    _email = TextEditingController();
    _phone = TextEditingController();
    _matric = TextEditingController();
    _password = TextEditingController();

    super.initState();
  }

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
                      const SizedBox(
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
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Your Email",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppTextFormField(
                        controller: _email,
                        hintText: ref.read(userProfileNotifierProvider)!.email,

                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Phone Number",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppTextFormField(
                        controller: _phone,
                        prefixText: "+234",
                        validator: validatePhoneNumber,
                        keyboardType: TextInputType.phone,
                        onChanged: (p0) {
                          if (p0.startsWith('0')) {
                            p0 = p0.replaceFirst('0', '+234');
                          } else {
                            p0 = '+234$p0';
                          }
                          // .updatePhone(p0.trim());
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Matric Number",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppTextFormField(
                        controller: _matric,
                        validator: validateMatric,
                        // onChanged: (p0) =>
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Password",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ValueListenableBuilder(
                        valueListenable: _obscureText,
                        builder: (context, value, child) =>
                            AppTextFormField(
                              controller: _password,
                              keyboardType:
                                  TextInputType.visiblePassword,
                              obscureText: _obscureText.value,
                              suffixIcon: InkWell(
                                  onTap: () => _obscureText.value =
                                      !_obscureText.value,
                                  child: Icon(
                                    _obscureText.value
                                        ? Icons.remove_red_eye
                                        : Icons.visibility_off,
                                    color: _obscureText.value
                                        ? AppColors.grey1
                                        : AppColors.primary,
                                  )),
                              validator: validatePassword,
                              // onChanged: (p0) =>
                                  
                            )),
                    ],
                  ),
                )
              ),

              AppActionButton(
                text: 'save', 
                onPressed: () {}, 
                isLoading: false
              ),
              const SizedBox(height: 4)
            ],
          ),
        )
      ),
    );
  }
}
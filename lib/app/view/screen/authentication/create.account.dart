import 'dart:developer';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:errandmate/app/viewmodel/provider/authentication/create.user.form.dart';
import 'package:errandmate/app/viewmodel/provider/faculty/faculty.dart';
import 'package:errandmate/app/viewmodel/provider/intitution/institution.provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/constant/app.colors/app.colors.dart';
import '../../../viewmodel/provider/authentication/create.user.dart';
import '../../../viewmodel/provider/department/department.dart';
import '../../helper/router.dart';
import '../../widget/action.button.dart';
import '../../widget/auth.text.headers.dart';
import '../../widget/dropdown.dart';
import '../../miscellaneous/global.dialog.dart';
import '../../widget/text.form.field.dart';
import 'helper/auth.helper.dart';
import 'helper/validator.dart';

class CreateAccount extends ConsumerStatefulWidget {
  const CreateAccount({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateAccountState();
}

class _CreateAccountState extends ConsumerState<CreateAccount>
    with Validators, AuthHelper, GlobalDialog, ViewRouter {
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _middlename = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _matric = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  final ValueNotifier<bool> _obscureConfirmPassword = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _firstname.dispose();
    _middlename.dispose();
    _lastname.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    _email.dispose();
    _matric.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accountForm = ref.read(createUserFormNotifierProvider.notifier);

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Create Account',
            style: Theme.of(context).textTheme.displaySmall),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Column(
                            children: [
                              const AuthTextHeader(
                                text:
                                    'Experience a new vibe of running errands.',
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Already have an account? ",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    children: [
                                      TextSpan(
                                        text: 'Login',
                                        style: TextStyle(
                                            color: AppColors.grey1,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => context.go('/auth'),
                                      )
                                    ]),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        AppTextFormField(
                          controller: _firstname,
                          labelText: 'First Name',
                          keyboardType: TextInputType.name,
                          validator: validateName,
                          onChanged: (p0) => accountForm.updateFirstname(p0),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppTextFormField(
                          controller: _middlename,
                          labelText: 'Last Name',
                          keyboardType: TextInputType.name,
                          validator: validateName,
                          onChanged: (p0) =>
                              accountForm.updateLastname(p0.trim()),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppTextFormField(
                          controller: _lastname,
                          labelText: 'Username',
                          keyboardType: TextInputType.text,
                          validator: validateUserName,
                          onChanged: (p0) =>
                              accountForm.updateUsername(p0.trim()),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DropDownField(
                          labelText: "Gender",
                          hintText: "Gender",
                          dropDownValueModel: const [],
                          dropDownValues: const ["Male", "Female"],
                          onChanged: (p0) => accountForm
                              .updateGender(p0.name.toString().trim()),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppTextFormField(
                          controller: _matric,
                          labelText: 'Matric Number',
                          validator: validateMatric,
                          onChanged: (p0) =>
                              accountForm.updateMatricNumber(p0.trim()),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppTextFormField(
                          controller: _email,
                          labelText: 'Email Address',
                          keyboardType: TextInputType.emailAddress,
                          validator: validateEmail,
                          onChanged: (p0) => accountForm.updateEmail(p0.trim()),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppTextFormField(
                          controller: _phone,
                          labelText: 'Phone Number',
                          prefixText: "+234",
                          validator: validatePhoneNumber,
                          keyboardType: TextInputType.phone,
                          onChanged: (p0) {
                            if (p0.startsWith('0')) {
                              p0 = p0.replaceFirst('0', '+234');
                            } else {
                              p0 = '+234$p0';
                            }
                            log('p0 = $p0');
                            accountForm.updatePhone(p0.trim());
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Consumer(builder: (context, ref, child) {
                          final institutionData = ref
                              .read(institutionNotifierProvider.notifier)
                              .getInstitutions;

                          return DropDownField(
                            hintText: 'Institution',
                            labelText: 'Institution',
                            dropDownValueModel: institutionData!
                                .map((institutionMap) => {
                                      "name": institutionMap.instName,
                                      "map": institutionMap
                                    })
                                .toList(),
                            onChanged: (value) {
                              if (value.toString().isNotEmpty) {
                                DropDownValueModel dropDownValue =
                                    value as DropDownValueModel;
                                var map = dropDownValue.value;

                                accountForm
                                    .updateInstitution(map.id.toString());

                                ref
                                    .read(facultyNotifierProvider.notifier)
                                    .fetchFaculties(instId: map.id, facId: '1');
                              } else {
                                ref
                                    .refresh(facultyNotifierProvider.notifier)
                                    .resetFaculties();
                              }
                            },
                          );
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        Consumer(builder: (context, ref, child) {
                          final facultyWatcher =
                              ref.watch(facultyNotifierProvider);

                          return DropDownField(
                            hintText: 'Faculty',
                            labelText: 'Faculty',
                            isLoading: facultyWatcher.isLoading,
                            dropDownValueModel: ref
                                .watch(facultyNotifierProvider.notifier)
                                .getFaculties
                                .map((facultyMap) => {
                                      "name": facultyMap.facultyName,
                                      "map": facultyMap
                                    })
                                .toList(),
                            onChanged: (value) {
                              if (value.toString().isNotEmpty) {
                                DropDownValueModel dropDownValue =
                                    value as DropDownValueModel;
                                var map = dropDownValue.value;

                                accountForm.updateFaculty(map.id.toString());

                                ref
                                    .read(departmentNotifierProvider.notifier)
                                    .fetchDepartments(
                                        instId: map.instId,
                                        facId: map.id.toString());
                              } else {
                                ref
                                    .refresh(
                                        departmentNotifierProvider.notifier)
                                    .resetDepartments();
                              }
                            },
                          );
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        Consumer(builder: (context, ref, child) {
                          final departmentWatcher =
                              ref.watch(departmentNotifierProvider);

                          return DropDownField(
                            hintText: 'Department',
                            labelText: 'Department',
                            isLoading: departmentWatcher.isLoading,
                            dropDownValueModel: ref
                                .watch(departmentNotifierProvider.notifier)
                                .getDepartments
                                .map((departmentMap) => {
                                      "name": departmentMap.departmentName,
                                      "map": departmentMap
                                    })
                                .toList(),
                            onChanged: (value) {
                              if (value.toString().isNotEmpty) {
                                DropDownValueModel dropDownValue =
                                    value as DropDownValueModel;
                                var map = dropDownValue.value;

                                accountForm.updateDepartment(map.id.toString());
                              }
                            },
                          );
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        ValueListenableBuilder(
                            valueListenable: _obscurePassword,
                            builder: (context, value, child) =>
                                AppTextFormField(
                                  controller: _password,
                                  labelText: 'Password',
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: _obscurePassword.value,
                                  suffixIcon: GestureDetector(
                                      onTap: () => _obscurePassword.value =
                                          !_obscurePassword.value,
                                      child: Icon(
                                        _obscurePassword.value
                                            ? Icons.remove_red_eye
                                            : Icons.visibility_off,
                                        color: _obscurePassword.value
                                            ? AppColors.grey1
                                            : AppColors.primary,
                                      )),
                                  validator: validatePassword,
                                  onChanged: (p0) =>
                                      accountForm.updatePassword(p0.trim()),
                                )),
                        const SizedBox(
                          height: 20,
                        ),
                        ValueListenableBuilder(
                            valueListenable: _obscureConfirmPassword,
                            builder: (context, value, child) =>
                                AppTextFormField(
                                  controller: _confirmPassword,
                                  labelText: 'Confirm Password',
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: _obscureConfirmPassword.value,
                                  suffixIcon: GestureDetector(
                                      onTap: () =>
                                          _obscureConfirmPassword.value =
                                              !_obscureConfirmPassword.value,
                                      child: Icon(
                                        _obscureConfirmPassword.value
                                            ? Icons.remove_red_eye
                                            : Icons.visibility_off,
                                        color: _obscureConfirmPassword.value
                                            ? AppColors.grey1
                                            : AppColors.primary,
                                      )),
                                  validator: (p0) => _confirmPassword
                                          .text.isEmpty
                                      ? 'Please enter a password'
                                      : _password.text == _confirmPassword.text
                                          ? null
                                          : 'Password doesn\'t match',
                                )),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          '''By proceeding, you agree to our Terms of Service and Privacy Policy''',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(
                          height: 35,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              AppActionButton(
                text: 'Continue',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    ref
                        .read(createUserAccountNotifierProvider.notifier)
                        .createUser();
                  }
                },
                isLoading:
                    ref.watch(createUserAccountNotifierProvider).isLoading,
              )
            ],
          ),
        ),
      ),
    );
  }
}

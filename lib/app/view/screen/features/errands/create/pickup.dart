import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../viewmodel/provider/errands/form/create.pickup.form.dart';
import '../../../../widget/text.form.field.dart';
import '../../../authentication/helper/validator.dart';

class CreatePickup extends ConsumerWidget with Validators {
  CreatePickup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final createPickupRef = ref.watch(createPickupFormNotifierProvider.notifier);

    return Form(
      key: createPickupRef.formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          AppTextFormField(
            controller: createPickupRef.packageLocationCotroller,
            labelText: 'package location',
            keyboardType: TextInputType.name,
            validator: validateUserName,
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextFormField(
            controller: createPickupRef.packageDestinationCotroller,
            labelText: 'package destination',
            keyboardType: TextInputType.name,
            validator: validateUserName,
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextFormField(
            controller: createPickupRef.packageDescriptionCotroller,
            labelText: 'package description',
            keyboardType: TextInputType.name,
            validator: validateUserName,
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextFormField(
            controller: createPickupRef.distanceCotroller,
            labelText: 'distance',
            keyboardType: TextInputType.number,
            validator: (p0) => p0 != null && p0.isEmpty ? "Field cannot be empty" : null,
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextFormField(
            controller: createPickupRef.transportModeCotroller,
            labelText: 'transport mode',
            keyboardType: TextInputType.number,
            validator: (p0) => p0 != null && p0.isEmpty ? "Field cannot be empty" : null,
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextFormField(
            controller: createPickupRef.receiverContactCotroller,
            labelText: 'receiver contact',
            prefixText: "+234",
            validator: validatePhoneNumber,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

}
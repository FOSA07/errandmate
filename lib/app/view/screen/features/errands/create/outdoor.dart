import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../viewmodel/provider/errands/form/create.outdoor.dart';
import '../../../../widget/text.form.field.dart';
import '../../../authentication/helper/validator.dart';

class CreateOutdoor extends ConsumerWidget with Validators {
  const CreateOutdoor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createOutdoorRef = ref.watch(createOutdoorFormNotifierProvider.notifier);

    return Form(
      key: createOutdoorRef.formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          AppTextFormField(
            controller: createOutdoorRef.senderLocationCotroller,
            labelText: 'sender location',
            keyboardType: TextInputType.name,
            validator: validateUserName,
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextFormField(
            controller: createOutdoorRef.locationCotroller,
            labelText: 'location',
            keyboardType: TextInputType.name,
            validator: validateUserName,
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextFormField(
            controller: createOutdoorRef.typeCotroller,
            labelText: 'type',
            keyboardType: TextInputType.name,
            validator: validateUserName,
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextFormField(
            controller: createOutdoorRef.descriptionCotroller,
            labelText: 'description',
            keyboardType: TextInputType.name,
            validator: validateUserName,
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextFormField(
            controller: createOutdoorRef.budgetCotroller,
            labelText: 'budget',
            keyboardType: TextInputType.number,
            validator: (p0) => p0 != null && p0.isEmpty ? "Field cannot be empty" : null,
          ),
        ]
      )
    );
  }
}
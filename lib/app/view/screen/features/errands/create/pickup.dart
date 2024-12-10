import 'dart:developer';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:errandmate/app/model/tranport.mode.model.dart';
import 'package:errandmate/app/view/widget/dropdown.dart';
import 'package:errandmate/app/viewmodel/provider/errands/transport/transport.mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../viewmodel/provider/errands/form/create.pickup.form.dart';
import '../../../../widget/text.form.field.dart';
import '../../../authentication/helper/validator.dart';

class CreatePickup extends ConsumerWidget with Validators {
  CreatePickup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createPickupRef =
        ref.watch(createPickupFormNotifierProvider.notifier);

    // Fetch transport modes
    ref.read(transportModeNotifierProvider.notifier).fetchtransaportModes();

    return Form(
      key: createPickupRef.formKey,
      child: Column(
        children: [
          const SizedBox(height: 25),
          AppTextFormField(
            controller: createPickupRef.packageLocationCotroller,
            labelText: 'Package Location',
            keyboardType: TextInputType.name,
            validator: validateUserName,
          ),
          const SizedBox(height: 20),
          AppTextFormField(
            controller: createPickupRef.packageDestinationCotroller,
            labelText: 'Package Destination',
            keyboardType: TextInputType.name,
            validator: validateUserName,
          ),
          const SizedBox(height: 20),
          AppTextFormField(
            controller: createPickupRef.packageDescriptionCotroller,
            labelText: 'Package Description',
            keyboardType: TextInputType.name,
            validator: validateUserName,
          ),
          const SizedBox(height: 20),
          AppTextFormField(
            controller: createPickupRef.distanceCotroller,
            labelText: 'Distance (in meters)',
            keyboardType: TextInputType.number,
            validator: (value) =>
                value != null && value.isEmpty ? "Field cannot be empty" : null,
          ),
          const SizedBox(height: 20),
          Consumer(
            builder: (context, ref, child) {
              final transportModeState =
                  ref.watch(transportModeNotifierProvider);

              if (transportModeState is AsyncLoading) {
                return const CircularProgressIndicator();
              }

              if (transportModeState.hasError) {
                return Text("Error loading transport modes");
              }

              if (transportModeState.value != null) {
                final transportModes = ref
                    .read(transportModeNotifierProvider.notifier)
                    .gettransaportModes;

                return DropDownField(
                  hintText: 'Select Transport Mode',
                  labelText: 'Transport Mode',
                  isLoading: false,
                  dropDownValueModel: transportModes.map((mode) {
                    return DropDownValueModel(
                      name: mode.mode?.name ?? 'Unknown',
                      value: mode, // Pass the TransportMode object directly
                    ).toJson();
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      final selectedMode = value.value as TransportMode;
                      createPickupRef.transportModeCotroller.text =
                          selectedMode.mode?.name ?? '';
                      log('Selected Transport Mode: ${selectedMode.mode?.name}');
                    }
                  },
                );
              }

              return Container(); // Fallback for unexpected cases
            },
          ),
          const SizedBox(height: 20),
          AppTextFormField(
            controller: createPickupRef.receiverContactCotroller,
            labelText: 'Receiver Contact',
            prefixText: "+234",
            validator: validatePhoneNumber,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

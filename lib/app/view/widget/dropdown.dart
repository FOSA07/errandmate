import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

import '../../utils/constant/app.colors/app.colors.dart';

class DropDownField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final List<Map<String, dynamic>> dropDownValueModel;
  final List dropDownValues;
  final ValueChanged? onChanged;
  final bool isLoading;
  const DropDownField({
    super.key, 
    required this.labelText, 
    required this.hintText, 
    required this.dropDownValueModel,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.onChanged,
    this.isLoading = false,
    List<dynamic>? dropDownValues
  }) : dropDownValues = dropDownValues ?? const [];

  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      clearOption: true,
      enableSearch: true,
      clearIconProperty: IconProperty(color: AppColors.progress),
      searchTextStyle: TextStyle(color: AppColors.white4),
      dropDownIconProperty: IconProperty(
        color: dropDownValueModel.isEmpty ? AppColors.progress : null,
        // icon: Icons.auto_awesome
        // icon: Icons.hourglass_bottom
        // icon: Icons.refresh
        icon: isLoading ? Icons.loop : Icons.arrow_drop_down
      ),
      searchDecoration: InputDecoration(
        hintText: "Search...",
        hintStyle: Theme.of(context).textTheme.bodySmall,
        // contentPadding: const EdgeInsets.only(left: 20)
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Required field";
        } else {
          return null;
        }
      },
      onChanged: onChanged,
      dropDownItemCount: 3,
      listTextStyle: Theme.of(context).textTheme.bodyLarge,
      textFieldDecoration: InputDecoration(
        labelText: labelText,
        hintText: '',
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelStyle: Theme.of(context).textTheme.bodySmall,
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: AppColors.grey2
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: AppColors.white3
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: AppColors.white3
          )
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: AppColors.progress
          )
        ),
      ),
      // dropDownList: dropDownValueModel,
      dropDownList: [
        ...List.generate(dropDownValues.isEmpty ? dropDownValueModel.length : dropDownValues.length, (index) => DropDownValueModel(
          name: dropDownValues.isEmpty ? dropDownValueModel[index]["name"]! : dropDownValues[index],
          value: dropDownValues.isEmpty ? dropDownValueModel[index]["map"]! : index)
        )
      ],
    );
  }
}
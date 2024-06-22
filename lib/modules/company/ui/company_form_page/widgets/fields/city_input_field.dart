import 'package:flutter/material.dart';
import 'package:botanico/modules/company/module.dart';

class CityInputField extends StatelessWidget {
  final FormHelper pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const CityInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.city,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      key: key ?? const Key('cityField'),
      label: 'Ciudad',
      pageController: pageController,
      fieldName: fieldName,
      keyboardType: TextInputType.text,
      validator: required ? (value) => ValidatorHelper.required(value) : null,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

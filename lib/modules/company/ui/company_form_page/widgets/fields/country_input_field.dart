import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';

class CountryInputField extends StatelessWidget {
  final FormHelper pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const CountryInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.country,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      key: key ?? const Key('countryField'),
      label: 'País',
      pageController: pageController,
      fieldName: fieldName,
      keyboardType: TextInputType.text,
      validator: required ? (value) => ValidatorHelper.required(value) : null,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

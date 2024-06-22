import 'package:flutter/material.dart';
import 'package:botanico/modules/company/module.dart';

class PhoneInputField extends StatelessWidget {
  final FormHelper pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const PhoneInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.phone,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      key: key ?? const Key('phoneField'),
      label: 'Teléfono',
      pageController: pageController,
      fieldName: fieldName,
      keyboardType: TextInputType.phone,
      validator: (value) => ValidatorHelper.number(value, required: required),
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';

class BirthdateInputField extends StatelessWidget {
  final FormHelper pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const BirthdateInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.birthDate,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      key: key ?? const Key('birthdateField'),
      label: 'Fecha de Nacimiento',
      pageController: pageController,
      fieldName: fieldName,
      keyboardType: TextInputType.datetime,
      validator: (value) => ValidatorHelper.date(value, required: required),
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

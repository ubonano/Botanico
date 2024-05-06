import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/material.dart';

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
      controller: pageController.getFieldController(fieldName)!,
      keyboardType: TextInputType.datetime,
      validator: (value) => ValidatorHelper.date(value, required: required),
      onFieldSubmitted: (_) => onFieldSubmitted != null ? onFieldSubmitted!() : null,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:botanico/modules/company/module.dart';

class WeightInputField extends StatelessWidget {
  final FormHelper pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const WeightInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.weight,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      key: key ?? const Key('weightField'),
      label: 'Peso/Volumen',
      pageController: pageController,
      fieldName: fieldName,
      keyboardType: TextInputType.number,
      validator: required ? (value) => ValidatorHelper.number(value) : null,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

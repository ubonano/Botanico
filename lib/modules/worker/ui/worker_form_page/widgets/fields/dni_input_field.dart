import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';

class DNIInputField extends StatelessWidget {
  final FormHelper pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const DNIInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.dni,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      key: key ?? const Key('dniField'),
      label: 'DNI',
      pageController: pageController,
      fieldName: fieldName,
      keyboardType: TextInputType.number,
      validator: (value) => ValidatorHelper.number(value, required: required),
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

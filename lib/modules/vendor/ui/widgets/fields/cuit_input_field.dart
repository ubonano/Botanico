import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';

class CuitInputField extends StatelessWidget {
  final FormHelper pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const CuitInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.cuit,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      key: key ?? const Key('cuitField'),
      label: 'CUIT',
      pageController: pageController,
      fieldName: fieldName,
      keyboardType: TextInputType.number,
      validator: required ? (value) => ValidatorHelper.number(value) : null,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

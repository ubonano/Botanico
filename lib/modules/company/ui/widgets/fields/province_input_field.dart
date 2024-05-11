import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';

class ProvinceInputField extends StatelessWidget {
  final FormHelper pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const ProvinceInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.province,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      key: key ?? const Key('provinceField'),
      label: 'Provincia',
      controller: pageController.getFieldController(fieldName)!,
      validator: required ? (value) => ValidatorHelper.required(value) : null,
      onFieldSubmitted: (_) => onFieldSubmitted != null ? onFieldSubmitted!() : null,
    );
  }
}

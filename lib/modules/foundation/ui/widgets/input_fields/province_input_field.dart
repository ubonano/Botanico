import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/material.dart';

class ProvinceInputField extends StatelessWidget {
  final FormController pageController;
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
      validator: required ? (value) => Validator.required(value) : null,
      onFieldSubmitted: (_) => onFieldSubmitted != null ? onFieldSubmitted!() : null,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';

class PackageInputField extends StatelessWidget {
  final FormHelper pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const PackageInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.package,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      key: key ?? const Key('packageField'),
      label: 'Bultos',
      pageController: pageController,
      fieldName: fieldName,
      validator: required ? (value) => ValidatorHelper.required(value) : null,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:botanico/modules/company/module.dart';

class CreatedDateTimeInputField extends StatelessWidget {
  final FormHelper pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const CreatedDateTimeInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.createdDateTime,
    this.onFieldSubmitted,
    this.required = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      key: key ?? const Key('createdDateTimeField'),
      label: 'Fecha y hora de creación',
      pageController: pageController,
      fieldName: fieldName,
      validator: required ? (value) => ValidatorHelper.required(value) : null,
      onFieldSubmitted: onFieldSubmitted,
      isEnabled: false,
    );
  }
}

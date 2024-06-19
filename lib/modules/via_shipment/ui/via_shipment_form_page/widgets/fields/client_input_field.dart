import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';

class ClientInputField extends StatelessWidget {
  final FormHelper pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const ClientInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.client,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      key: key ?? const Key('clientField'),
      label: 'Cliente',
      pageController: pageController,
      fieldName: fieldName,
      validator: required ? (value) => ValidatorHelper.required(value) : null,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

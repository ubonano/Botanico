import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:flutter/material.dart';

class AddressInputField extends StatelessWidget {
  final FormController pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const AddressInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.address,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      key: key ?? const Key('addressField'),
      label: 'Dirección',
      controller: pageController.getFieldController(fieldName)!,
      validator: required ? (value) => Validator.required(value) : null,
      onFieldSubmitted: (_) => onFieldSubmitted != null ? onFieldSubmitted!() : null,
    );
  }
}

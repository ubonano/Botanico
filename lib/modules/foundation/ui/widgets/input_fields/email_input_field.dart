import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/material.dart';

class EmailInputField extends StatelessWidget {
  final FormController pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const EmailInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.email,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      key: key ?? const Key('emailField'),
      label: 'Email',
      controller: pageController.getFieldController(fieldName)!,
      keyboardType: TextInputType.emailAddress,
      validator: (value) => Validator.email(value, required: required),
      onFieldSubmitted: (_) => onFieldSubmitted != null ? onFieldSubmitted!() : null,
    );
  }
}

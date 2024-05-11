import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';

class PasswordInputField extends StatelessWidget {
  final FormHelper pageController;
  final String fieldName;
  final bool obscureText;
  final bool required;
  final Function? onFieldSubmitted;

  const PasswordInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.password,
    this.obscureText = true,
    this.required = true,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      key: key ?? const Key('passwordField'),
      label: 'Contraseña',
      controller: pageController.getFieldController(fieldName)!,
      obscureText: obscureText,
      validator: (value) => ValidatorHelper.password(value, required: required),
      onFieldSubmitted: (_) => onFieldSubmitted != null ? onFieldSubmitted!() : null,
    );
  }
}

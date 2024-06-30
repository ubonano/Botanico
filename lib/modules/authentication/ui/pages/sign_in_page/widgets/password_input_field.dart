import 'package:flutter/material.dart';

import '../../../../../app/content/setup/fields_key.dart';
import '../../../../../app/content/helpers/form_helper.dart';
import '../../../../../app/content/helpers/validator_helper.dart';
import '../../../../../app/ui/ui.dart';

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
      pageController: pageController,
      fieldName: fieldName,
      obscureText: obscureText,
      validator: (value) => ValidatorHelper.password(value, required: required),
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

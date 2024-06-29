import 'package:flutter/material.dart';

import '../../../../app/content/setup/fields_key.dart';
import '../../../../app/content/helpers/form_helper.dart';
import '../../../../app/content/helpers/validator_helper.dart';
import '../../../../app/ui/widgets/custom_input_field.dart';

class ConfirmPasswordInputField extends StatelessWidget {
  final FormHelper pageController;
  final String fieldName;
  final String passwordFieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const ConfirmPasswordInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.passwordConfirm,
    this.passwordFieldName = FieldKeys.password,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      key: key ?? const Key('confirmPasswordField'),
      label: 'Confirmar Contraseña',
      pageController: pageController,
      fieldName: fieldName,
      obscureText: true,
      validator: (value) => ValidatorHelper.confirmPassword(
        value,
        pageController.getFieldController(passwordFieldName)!.text,
        required: required,
      ),
      textInputAction: TextInputAction.go,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

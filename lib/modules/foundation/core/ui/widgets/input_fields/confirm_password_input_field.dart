import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:flutter/material.dart';

class ConfirmPasswordInputField extends StatelessWidget {
  final UIFormController pageController;
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
      controller: pageController.getFieldController(fieldName)!,
      obscureText: true,
      validator: (value) => Validator.confirmPassword(
        value,
        pageController.getFieldController(passwordFieldName)!.text,
        required: required,
      ),
      textInputAction: TextInputAction.go,
      onFieldSubmitted: (_) => onFieldSubmitted != null ? onFieldSubmitted!() : null,
    );
  }
}

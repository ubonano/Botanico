import 'package:flutter/material.dart';
import '../../../utils/validator.dart';
import 'custom_input_field.dart';

class ConfirmPasswordInputField extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController passwordController;
  final Function? onFieldSubmitted;

  const ConfirmPasswordInputField({
    Key? key,
    required this.controller,
    required this.passwordController,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      label: 'Confirmar Contraseña',
      controller: controller,
      obscureText: true,
      validator: (value) => Validator.confirmPasswordValidator(value, passwordController.text),
      textInputAction: TextInputAction.go,
      onFieldSubmitted: (_) => onFieldSubmitted != null ? onFieldSubmitted!() : null,
    );
  }
}

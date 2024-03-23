import 'package:flutter/material.dart';
import '../../../utils/validator.dart';
import 'custom_input_field.dart';

class ConfirmPasswordInputField extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController passwordController;
  final Function? onFieldSubmitted;
  final bool required;

  const ConfirmPasswordInputField({
    Key? key,
    required this.controller,
    required this.passwordController,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      label: 'Confirmar Contraseña',
      controller: controller,
      obscureText: true,
      validator: (value) => Validator.confirmPassword(value, passwordController.text, required: required),
      textInputAction: TextInputAction.go,
      onFieldSubmitted: (_) => onFieldSubmitted != null ? onFieldSubmitted!() : null,
    );
  }
}

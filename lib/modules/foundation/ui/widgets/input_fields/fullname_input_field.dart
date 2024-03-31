import 'package:flutter/material.dart';
import '../../../aux/validator.dart';
import 'custom_input_field.dart';

class FullnameInputField extends StatelessWidget {
  final TextEditingController controller;
  final Function? onFieldSubmitted;
  final bool required;

  const FullnameInputField({
    Key? key,
    required this.controller,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      label: 'Nombre completo',
      controller: controller,
      validator: required ? (value) => Validator.required(value) : null,
      onFieldSubmitted: (_) => onFieldSubmitted != null ? onFieldSubmitted!() : null,
    );
  }
}

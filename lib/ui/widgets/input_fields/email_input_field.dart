import 'package:flutter/material.dart';
import '../../../auxiliaries/validator.dart';
import 'custom_input_field.dart';

class EmailInputField extends StatelessWidget {
  final TextEditingController controller;
  final Function? onFieldSubmitted;
  final bool required;

  const EmailInputField({
    Key? key,
    required this.controller,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      label: 'Email',
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      validator: (value) => Validator.email(value, required: required),
      onFieldSubmitted: (_) => onFieldSubmitted != null ? onFieldSubmitted!() : null,
    );
  }
}

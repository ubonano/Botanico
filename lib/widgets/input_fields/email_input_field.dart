import 'package:flutter/material.dart';
import '../../../utils/validator.dart';
import 'custom_input_field.dart';

class EmailInputField extends StatelessWidget {
  final TextEditingController controller;
  final Function? onFieldSubmitted;

  const EmailInputField({
    Key? key,
    required this.controller,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      label: 'Email',
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      validator: Validator.email,
      onFieldSubmitted: (_) => onFieldSubmitted != null ? onFieldSubmitted!() : null,
    );
  }
}

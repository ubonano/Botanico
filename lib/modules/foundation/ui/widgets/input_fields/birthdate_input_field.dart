import 'package:flutter/material.dart';
import '../../../aux/validator.dart';
import 'custom_input_field.dart';

class BirthdateInputField extends StatelessWidget {
  final TextEditingController controller;
  final Function? onFieldSubmitted;
  final bool required;

  const BirthdateInputField({
    Key? key,
    required this.controller,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      label: 'Fecha de Nacimiento',
      controller: controller,
      keyboardType: TextInputType.datetime,
      validator: (value) => Validator.date(value, required: required),
      onFieldSubmitted: (_) => onFieldSubmitted != null ? onFieldSubmitted!() : null,
    );
  }
}

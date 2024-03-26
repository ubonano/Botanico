import 'package:flutter/material.dart';
import '../../../auxiliaries/validator.dart';
import 'custom_input_field.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;
  final Function? onFieldSubmitted;
  final bool required;

  const PhoneInputField({
    Key? key,
    required this.controller,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      label: 'Teléfono',
      controller: controller,
      keyboardType: TextInputType.phone,
      validator: (value) => Validator.number(value, required: required),
      onFieldSubmitted: (_) => onFieldSubmitted != null ? onFieldSubmitted!() : null,
    );
  }
}

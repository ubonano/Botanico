import 'package:flutter/material.dart';
import '../../../utils/validator.dart';
import 'custom_input_field.dart';

class WorkerUidInputField extends StatelessWidget {
  final TextEditingController controller;
  final Function? onFieldSubmitted;
  final bool required;

  const WorkerUidInputField({
    Key? key,
    required this.controller,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      label: 'Código del Trabajador',
      controller: controller,
      validator: required ? (value) => Validator.required(value) : null,
      onFieldSubmitted: (_) => onFieldSubmitted != null ? onFieldSubmitted!() : null,
    );
  }
}

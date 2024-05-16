import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool enabled;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final InputBorder? border;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;

  const CustomInputField({
    Key? key,
    required this.label,
    this.obscureText = false,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
    this.validator,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.border = const OutlineInputBorder(),
    this.readOnly = false,
    this.textInputAction,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          enabled: enabled,
          decoration: InputDecoration(
            labelText: label,
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: border,
          ),
          readOnly: readOnly,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class CustomInputFieldArea extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool enabled;
  final int? maxLines;
  final int? minLines;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final InputBorder? border;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;

  const CustomInputFieldArea({
    Key? key,
    required this.label,
    this.obscureText = false,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.enabled = true,
    this.maxLines,
    this.minLines,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.border = const OutlineInputBorder(),
    this.readOnly = false,
    this.textInputAction,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          enabled: enabled,
          maxLines: maxLines,
          minLines: minLines,
          decoration: InputDecoration(
            labelText: label,
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: border,
          ),
          readOnly: readOnly,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

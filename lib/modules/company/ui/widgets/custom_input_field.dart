import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/form_helper.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String fieldName;
  final FormHelper pageController;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool isEnabled;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final InputBorder? border;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final Function? onFieldSubmitted;

  const CustomInputField({
    Key? key,
    required this.label,
    required this.fieldName,
    required this.pageController,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.isEnabled = true,
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
    return Obx(
      () => Column(
        children: [
          TextFormField(
            controller: pageController.getFieldController(fieldName)!,
            obscureText: obscureText,
            keyboardType: keyboardType,
            validator: validator,
            enabled: pageController.isUpdateModeRx.value ? pageController.isFieldsEnabled.value : true && isEnabled,
            decoration: InputDecoration(
              labelText: label,
              hintText: hintText,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              border: border,
            ),
            readOnly: readOnly,
            textInputAction: textInputAction,
            onFieldSubmitted: (value) => onFieldSubmitted != null ? onFieldSubmitted!() : null,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class CustomInputFieldArea extends StatelessWidget {
  final String label;
  final bool obscureText;
  final FormHelper pageController;
  final String fieldName;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final int? maxLines;
  final int? minLines;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final InputBorder? border;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final Function? onFieldSubmitted;

  const CustomInputFieldArea({
    Key? key,
    required this.label,
    this.obscureText = false,
    required this.pageController,
    required this.fieldName,
    this.keyboardType = TextInputType.text,
    this.validator,
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
    return Obx(
      () => Column(
        children: [
          TextFormField(
            controller: pageController.getFieldController(fieldName)!,
            obscureText: obscureText,
            keyboardType: keyboardType,
            validator: validator,
            enabled: pageController.isUpdateModeRx.value ? pageController.isFieldsEnabled.value : true,
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
            onFieldSubmitted: (value) => onFieldSubmitted != null ? onFieldSubmitted!() : null,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

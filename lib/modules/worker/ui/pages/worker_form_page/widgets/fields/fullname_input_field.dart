import 'package:flutter/material.dart';
import '../../../../../../app/content/helpers/form_helper.dart';
import '../../../../../../app/content/helpers/validator_helper.dart';
import '../../../../../../app/content/setup/fields_key.dart';
import '../../../../../../app/ui/ui.dart';

class FullnameInputField extends StatelessWidget {
  final FormHelper pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const FullnameInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.fullname,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      key: key ?? const Key('fullnameField'),
      label: 'Nombre completo',
      pageController: pageController,
      fieldName: fieldName,
      keyboardType: TextInputType.text,
      validator: required ? (value) => ValidatorHelper.required(value) : null,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

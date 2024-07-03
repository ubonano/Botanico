import 'package:flutter/material.dart';

import '../../../../../app/content/setup/fields_key.dart';
import '../../../../../app/content/helpers/form_helper.dart';
import '../../../../../app/content/helpers/validator_helper.dart';
import '../../../../../app/ui/ui.dart';

class EmailInputField extends StatelessWidget {
  final FormHelper pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const EmailInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.email,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      key: key ?? const Key('emailField'),
      label: 'Email',
      pageController: pageController,
      fieldName: fieldName,
      keyboardType: TextInputType.emailAddress,
      validator: (value) => ValidatorHelper.email(value, required: required),
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

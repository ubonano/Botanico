import 'package:flutter/material.dart';

import '../../../../../app/content/setup/fields_key.dart';
import '../../../../../app/content/helpers/form_helper.dart';
import '../../../../../app/content/helpers/validator_helper.dart';
import '../../../../../app/ui/ui.dart';

class DescriptionInputField extends StatelessWidget {
  final FormHelper pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const DescriptionInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.description,
    this.onFieldSubmitted,
    this.required = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputFieldArea(
      key: key ?? const Key('descriptionField'),
      label: 'Descripción',
      minLines: 3,
      maxLines: 5,
      pageController: pageController,
      fieldName: fieldName,
      validator: required ? (value) => ValidatorHelper.required(value) : null,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

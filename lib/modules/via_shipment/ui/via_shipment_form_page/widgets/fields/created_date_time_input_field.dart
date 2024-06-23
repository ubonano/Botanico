import 'package:flutter/material.dart';

import '../../../../../company/helpers/fields_key.dart';
import '../../../../../company/helpers/form_helper.dart';
import '../../../../../company/helpers/validator_helper.dart';
import '../../../../../company/ui/ui.dart';

class CreatedDateTimeInputField extends StatelessWidget {
  final FormHelper pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const CreatedDateTimeInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.createdDateTime,
    this.onFieldSubmitted,
    this.required = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      key: key ?? const Key('createdDateTimeField'),
      label: 'Fecha y hora de creación',
      pageController: pageController,
      fieldName: fieldName,
      validator: required ? (value) => ValidatorHelper.required(value) : null,
      onFieldSubmitted: onFieldSubmitted,
      isEnabled: false,
    );
  }
}

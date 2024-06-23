import 'package:flutter/material.dart';

import '../../../../helpers/form_helper.dart';
import '../../../../helpers/fields_key.dart';
import '../../../ui.dart';
import '../../../../helpers/validator_helper.dart';

class ProvinceInputField extends StatelessWidget {
  final FormHelper pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const ProvinceInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.province,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      key: key ?? const Key('provinceField'),
      label: 'Provincia',
      pageController: pageController,
      fieldName: fieldName,
      keyboardType: TextInputType.text,
      validator: required ? (value) => ValidatorHelper.required(value) : null,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

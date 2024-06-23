import 'package:flutter/material.dart';

import '../../../../helpers/fields_key.dart';
import '../../../../helpers/form_helper.dart';
import '../../../../helpers/validator_helper.dart';
import '../../../ui.dart';

class AddressInputField extends StatelessWidget {
  final FormHelper pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const AddressInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.address,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      key: key ?? const Key('addressField'),
      label: 'Dirección',
      pageController: pageController,
      fieldName: fieldName,
      validator: required ? (value) => ValidatorHelper.required(value) : null,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../company/helpers/fields_key.dart';
import '../../../../../company/helpers/form_helper.dart';
import '../../../../../company/helpers/validator_helper.dart';
import '../../../../../company/ui/ui.dart';

class ShipmentIdInputField extends StatelessWidget {
  final FormHelper pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const ShipmentIdInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.shipmentId,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      key: key ?? const Key('shipmentIdField'),
      label: 'Número de envío',
      pageController: pageController,
      fieldName: fieldName,
      validator: required ? (value) => ValidatorHelper.number(value) : null,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

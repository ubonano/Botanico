import 'package:flutter/material.dart';

import '../../../../../../app/content/setup/fields_key.dart';
import '../../../../../../app/content/helpers/form_helper.dart';
import '../../../../../../app/content/helpers/validator_helper.dart';
import '../../../../../../app/ui/ui.dart';

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
      validator: required ? (value) => ValidatorHelper.integer(value) : null,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

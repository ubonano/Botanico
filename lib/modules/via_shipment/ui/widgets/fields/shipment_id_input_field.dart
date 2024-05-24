import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';

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
      label: 'Nmero de envío',
      pageController: pageController,
      fieldName: fieldName,
      validator: required ? (value) => ValidatorHelper.required(value) : null,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

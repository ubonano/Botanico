import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

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
    return Obx(
      () {
        return CustomInputField(
          key: key ?? const Key('addressField'),
          label: 'Dirección',
          controller: pageController.getFieldController(fieldName)!,
          validator: required ? (value) => ValidatorHelper.required(value) : null,
          onFieldSubmitted: (_) => onFieldSubmitted != null ? onFieldSubmitted!() : null,
          enabled: pageController.isUpdateModeRx.value ? pageController.isFieldsEnabled.value : true,
        );
      },
    );
  }
}

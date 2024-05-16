import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

class CuitInputField extends StatelessWidget {
  final FormHelper pageController;
  final String fieldName;
  final Function? onFieldSubmitted;
  final bool required;

  const CuitInputField(
    this.pageController, {
    Key? key,
    this.fieldName = FieldKeys.cuit,
    this.onFieldSubmitted,
    this.required = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return CustomInputField(
          key: key ?? const Key('cuitField'),
          label: 'CUIT',
          controller: pageController.getFieldController(fieldName)!,
          keyboardType: TextInputType.number,
          validator: required ? (value) => ValidatorHelper.number(value) : null,
          onFieldSubmitted: (_) => onFieldSubmitted != null ? onFieldSubmitted!() : null,
          enabled: pageController.isUpdateModeRx.value ? pageController.isFieldsEnabled.value : true,
        );
      },
    );
  }
}

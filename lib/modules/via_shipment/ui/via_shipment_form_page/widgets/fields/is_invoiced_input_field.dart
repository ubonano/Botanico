import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../ui.dart';

class IsInvoicedInputField extends GetView<ViaShipmentFormController> {
  const IsInvoicedInputField(this.pageController, {super.key});

  final ViaShipmentFormController pageController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final value = pageController.isInvoiced.value;

        return SwitchListTile(
          key: const Key('isInvoicedField'),
          title: const Text('Facturado'),
          value: value,
          onChanged: pageController.isFieldsEnabled.value || !pageController.isUpdateModeRx.value
              ? (newValue) {
                  pageController.isInvoiced.value = newValue;
                }
              : null,
        );
      },
    );
  }
}

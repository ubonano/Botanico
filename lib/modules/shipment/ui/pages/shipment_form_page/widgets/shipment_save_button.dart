import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/ui/ui.dart';
import '../../../ui.dart';

class ShipmentSaveButton extends GetView<ShipmentFormController> {
  const ShipmentSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomButton(
        key: key ?? const Key('ShipmentSaveButton'),
        text: 'Guardar envío',
        onPressed: controller.secureSubmit,
        enabled: controller.isUpdateModeRx.value ? controller.isFieldsEnabled.value : true,
        isLoading: controller.isLoading.value,
      ),
    );
  }
}

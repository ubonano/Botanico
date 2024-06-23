import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';

import '../../ui.dart';

class ViaShipmentSaveButton extends GetView<ViaShipmentFormController> {
  const ViaShipmentSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomButton(
        key: key ?? const Key('ViaShipmentSaveButton'),
        text: 'Guardar envío',
        onPressed: controller.secureSubmit,
        enabled: controller.isUpdateModeRx.value ? controller.isFieldsEnabled.value : true,
      ),
    );
  }
}

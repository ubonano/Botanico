import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/ui.dart';
import '../../ui.dart';

class VendorSaveButton extends GetView<VendorFormController> {
  const VendorSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomButton(
        key: key ?? const Key('VendorSaveButton'),
        text: 'Guardar proveedor',
        onPressed: controller.secureSubmit,
        enabled: controller.isUpdateModeRx.value ? controller.isFieldsEnabled.value : true,
      ),
    );
  }
}

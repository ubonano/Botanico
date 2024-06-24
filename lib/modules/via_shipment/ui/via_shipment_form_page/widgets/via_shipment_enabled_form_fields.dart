import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/ui.dart';
import '../../../content/setup/permissions.dart';
import '../../ui.dart';

class ViaShipmentEnabledFormFields extends GetView<ViaShipmentFormController> {
  const ViaShipmentEnabledFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<ViaShipmentPermissions>();

    return ProtectedWidget(
      module: module,
      permission: module.updateKey,
      child: IconButton(
        key: key ?? const Key('ViaShipmentEnabledFormFields'),
        icon: const Icon(Icons.edit),
        onPressed: () => controller.isFieldsEnabled.value = !controller.isFieldsEnabled.value,
      ),
    );
  }
}

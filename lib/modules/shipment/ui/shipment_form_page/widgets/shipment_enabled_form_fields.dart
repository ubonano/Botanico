import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/ui.dart';
import '../../../content/setup/permissions.dart';
import '../../ui.dart';

class ShipmentEnabledFormFields extends GetView<ShipmentFormController> {
  const ShipmentEnabledFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<ShipmentPermissions>();

    return ProtectedWidget(
      module: module,
      permission: module.updateKey,
      child: IconButton(
        key: key ?? const Key('ShipmentEnabledFormFields'),
        icon: const Icon(Icons.edit),
        onPressed: () => controller.isFieldsEnabled.value = !controller.isFieldsEnabled.value,
      ),
    );
  }
}

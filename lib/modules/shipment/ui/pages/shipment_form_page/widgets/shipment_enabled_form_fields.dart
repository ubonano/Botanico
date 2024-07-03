import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/ui/ui.dart';
import '../../../../setup/module.dart';
import '../../../ui.dart';

class ShipmentEnabledFormFields extends GetView<ShipmentFormController> {
  const ShipmentEnabledFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<ShipmentModule>();

    return ProtectedWidget(
      module: module,
      permission: ShipmentKeys.update.id,
      child: IconButton(
        key: key ?? const Key('ShipmentEnabledFormFields'),
        icon: const Icon(Icons.edit),
        onPressed: () => controller.isFieldsEnabled.value = !controller.isFieldsEnabled.value,
      ),
    );
  }
}

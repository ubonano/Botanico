import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../company/ui/ui.dart';
import '../../../setup/permissions.dart';
import '../../ui.dart';

class VendorEnabledFormFields extends GetView<VendorFormController> {
  const VendorEnabledFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<VendorPermissions>();

    return ProtectedWidget(
      module: module,
      permission: module.updateKey,
      child: IconButton(
        key: key ?? const Key('VendorEnabledFormFields'),
        icon: const Icon(Icons.edit),
        onPressed: () => controller.isFieldsEnabled.value = !controller.isFieldsEnabled.value,
      ),
    );
  }
}

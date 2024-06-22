import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../module.dart';

class VendorEnabledFormFields extends GetView<VendorFormController> {
  const VendorEnabledFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      module: VendorModulePermissions().toModel(),
      permission: VendorModulePermissions.updateKey,
      child: IconButton(
        key: key ?? const Key('VendorEnabledFormFields'),
        icon: const Icon(Icons.edit),
        onPressed: () => controller.isFieldsEnabled.value = !controller.isFieldsEnabled.value,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';

import '../../../module.dart';

class VendorEnabledFormFields extends GetView<VendorFormController> {
  const VendorEnabledFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      module: VendorModule(),
      permission: VendorModule.updateKey,
      child: IconButton(
        key: key ?? const Key('VendorEnabledFormFields'),
        icon: const Icon(Icons.edit),
        onPressed: () => controller.isFieldsEnabled.value = !controller.isFieldsEnabled.value,
      ),
    );
  }
}

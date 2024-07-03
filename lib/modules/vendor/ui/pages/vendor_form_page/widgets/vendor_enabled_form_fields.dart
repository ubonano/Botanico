import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/ui/ui.dart';
import '../../../../setup/module.dart';
import '../../../ui.dart';

class VendorEnabledFormFields extends GetView<VendorFormController> {
  const VendorEnabledFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<VendorModule>();

    return ProtectedWidget(
      module: module,
      permission: VendorKeys.update.id,
      child: IconButton(
        key: key ?? const Key('VendorEnabledFormFields'),
        icon: const Icon(Icons.edit),
        onPressed: () => controller.isFieldsEnabled.value = !controller.isFieldsEnabled.value,
      ),
    );
  }
}

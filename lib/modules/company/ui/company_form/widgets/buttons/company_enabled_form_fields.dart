import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../../module.dart';

class CompanyEnabledFormFields extends GetView<CompanyFormController> {
  const CompanyEnabledFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      module: CompanyModule(),
      permission: CompanyModule.updateKey,
      child: IconButton(
        key: key ?? const Key('CompanyEnabledFormFields'),
        icon: const Icon(Icons.edit),
        onPressed: () => controller.isFieldsEnabled.value = !controller.isFieldsEnabled.value,
      ),
    );
  }
}

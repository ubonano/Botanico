import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/ui/ui.dart';
import '../../../../setup/permissions.dart';
import '../../../ui.dart';

class CompanyEnabledFormFields extends GetView<CompanyFormController> {
  const CompanyEnabledFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    late final CompanyPermissions module = Get.find();

    return ProtectedWidget(
      module: module,
      permission: module.updateKey,
      child: IconButton(
        key: key ?? const Key('CompanyEnabledFormFields'),
        icon: const Icon(Icons.edit),
        onPressed: () => controller.isFieldsEnabled.value = !controller.isFieldsEnabled.value,
      ),
    );
  }
}

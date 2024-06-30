import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/ui/ui.dart';
import '../../../../setup/permissions.dart';
import '../../../ui.dart';

class AccountingAccountEnabledFormFields extends GetView<AccountingAccountFormController> {
  const AccountingAccountEnabledFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<AccountingAccountPermissions>();

    return ProtectedWidget(
      module: module,
      permission: module.updateKey,
      child: IconButton(
        key: key ?? const Key('AccountingAccountEnabledFormFields'),
        icon: const Icon(Icons.edit),
        onPressed: () => controller.isFieldsEnabled.value = !controller.isFieldsEnabled.value,
      ),
    );
  }
}

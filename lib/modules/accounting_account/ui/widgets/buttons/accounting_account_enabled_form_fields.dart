import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../module.dart';

class AccountingAccountEnabledFormFields extends GetView<AccountingAccountFormController> {
  const AccountingAccountEnabledFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      module: AccountingAccountModulePermissions().toModel(),
      permission: AccountingAccountModulePermissions.updateKey,
      child: IconButton(
        key: key ?? const Key('AccountingAccountEnabledFormFields'),
        icon: const Icon(Icons.edit),
        onPressed: () => controller.isFieldsEnabled.value = !controller.isFieldsEnabled.value,
      ),
    );
  }
}

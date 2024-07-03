import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/ui/ui.dart';
import '../../../../setup/module.dart';
import '../../../ui.dart';

class AccountingAccountEnabledFormFields extends GetView<AccountingAccountFormController> {
  const AccountingAccountEnabledFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<AccountingAccountModule>();

    return ProtectedWidget(
      module: module,
      permission: AccountingAccountKeys.update.id,
      child: IconButton(
        key: key ?? const Key('AccountingAccountEnabledFormFields'),
        icon: const Icon(Icons.edit),
        onPressed: () => controller.isFieldsEnabled.value = !controller.isFieldsEnabled.value,
      ),
    );
  }
}

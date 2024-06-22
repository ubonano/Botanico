import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';

import '../../../module.dart';

class AccountingAccountSaveButton extends GetView<AccountingAccountFormController> {
  const AccountingAccountSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomButton(
        key: key ?? const Key('AccountingAccountSaveButton'),
        text: 'Guardar cuenta contable',
        onPressed: controller.secureSubmit,
        enabled: controller.isUpdateModeRx.value ? controller.isFieldsEnabled.value : true,
      ),
    );
  }
}


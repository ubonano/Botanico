import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/widgets/buttons/custom_button.dart';
import '../../ui.dart';

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

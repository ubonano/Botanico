import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../app/ui/ui.dart';
import '../../../../ui.dart';

class CompanySaveButton extends GetView<CompanyFormController> {
  const CompanySaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomButton(
        key: key ?? const Key('CompanySaveButton'),
        text: 'Guardar empresa',
        onPressed: controller.secureSubmit,
        enabled: controller.isUpdateModeRx.value ? controller.isFieldsEnabled.value : true,
        isLoading: controller.isLoading.value,
      ),
    );
  }
}

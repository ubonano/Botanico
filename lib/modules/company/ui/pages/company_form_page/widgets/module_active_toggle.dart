import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../setup/interfaces/i_company_service.dart';
import '../../../ui.dart';

class ModuleActiveToggle extends GetView<CompanyFormController> {
  final IModuleStructure module;

  const ModuleActiveToggle(this.module, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return CheckboxListTile(
          title: Text(module.label),
          value: Get.find<ICompanyService>().currentCompany$?.hasModuleActiveDeprecated(module),
          onChanged: (bool? value) => controller.toggleModule(module),
        );
      },
    );
  }
}

import 'package:botanico/modules/company/module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

class ModuleActiveToggle extends GetView<CompanyFormController> {
  final ModuleModel module;

  const ModuleActiveToggle(this.module, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return CheckboxListTile(
          title: Text(module.name),
          value: Get.find<ICompanyService>().loggedCompany$?.hasModuleActive(module),
          onChanged: (bool? value) => controller.toggleModule(module),
        );
      },
    );
  }
}

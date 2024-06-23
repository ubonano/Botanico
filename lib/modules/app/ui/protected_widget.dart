import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../worker/setup/interfaces/i_worker_service.dart';
import '../../company/setup/interfaces/i_company_service.dart';

class ProtectedWidget extends StatelessWidget {
  final Widget child;
  final String permission;
  final IPermissionsStructure module;

  const ProtectedWidget({required this.module, required this.permission, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Get.find<ICompanyService>().loggedCompany$?.hasModuleActive(module) == true &&
              Get.find<IWorkerService>().loggedWorker$?.hasPermission(permission) == true
          ? child
          : const SizedBox.shrink(),
    );
  }
}

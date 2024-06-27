import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../worker/content/setup/interfaces/i_worker_service.dart';
import '../../company/content/setup/interfaces/i_company_service.dart';

class ProtectedWidget extends StatelessWidget {
  final Widget child;
  final String? permission;
  final IPermissionsStructure module;

  const ProtectedWidget({required this.module, this.permission, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final companyService = Get.find<ICompanyService>();
        final workerService = Get.find<IWorkerService>();
        final hasModuleActive = companyService.loggedCompany$?.hasModuleActive(module) == true;
        final hasPermission = permission == null || workerService.loggedWorker$?.hasPermission(permission!) == true;

        return hasModuleActive && hasPermission ? child : const SizedBox.shrink();
      },
    );
  }
}

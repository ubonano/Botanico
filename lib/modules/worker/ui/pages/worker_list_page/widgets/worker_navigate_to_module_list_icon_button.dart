import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/ui/ui.dart';
import '../../../../content/model/worker_model.dart';
import '../../../../content/setup/permissions.dart';
import '../../../ui.dart';

class WorkerNavigateToModuleListIconButton extends StatelessWidget {
  final WorkerModel worker;

  const WorkerNavigateToModuleListIconButton(this.worker, {super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<WorkerPermissions>();
    return ProtectedWidget(
      module: module,
      permission: module.managePermissionsKey,
      child: IconButton(
        key: key ?? const Key('WorkerNavigateToModuleListIconButton'),
        icon: const Icon(Icons.security),
        onPressed: () => WorkerPermissionManagementPage.navigate(argument: worker.uid, canPop: true),
      ),
    );
  }
}

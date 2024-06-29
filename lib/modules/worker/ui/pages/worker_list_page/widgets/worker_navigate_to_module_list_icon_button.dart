import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../app/ui/navigation.dart';
import '../../../../../app/ui/ui.dart';
import '../../../../content/model/worker_model.dart';
import '../../../../content/setup/permissions.dart';

class WorkerNavigateToModuleListIconButton extends StatelessWidget with AppNavigationInstance {
  final WorkerModel worker;

  WorkerNavigateToModuleListIconButton(this.worker, {super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<WorkerPermissions>();
    return ProtectedWidget(
      module: module,
      permission: module.managePermissionsKey,
      child: IconButton(
        key: key ?? const Key('WorkerNavigateToModuleListIconButton'),
        icon: const Icon(Icons.security),
        onPressed: () => navigate.toPermissions(worker.uid, canPop: true),
      ),
    );
  }
}

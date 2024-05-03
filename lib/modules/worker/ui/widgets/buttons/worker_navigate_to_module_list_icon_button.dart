import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkerNavigateToModuleListIconButton extends StatelessWidget {
  final WorkerModel worker;

  const WorkerNavigateToModuleListIconButton(this.worker, {super.key});

  @override
  Widget build(BuildContext context) {
    return PermissionProtected(
      permission: WorkerModulePermissions.managePermissionsKey,
      child: IconButton(
        key: key ?? const Key('WorkerNavigateToModuleListIconButton'),
        icon: const Icon(Icons.security),
        onPressed: () => Get.find<NavigationHelper>().toPermissions(worker.uid, canPop: true),
      ),
    );
  }
}

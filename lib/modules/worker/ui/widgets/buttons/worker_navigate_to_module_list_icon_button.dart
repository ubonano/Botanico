import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:flutter/material.dart';

class WorkerNavigateToModuleListIconButton extends StatelessWidget with NavigationHelperInstance {
  final WorkerModel worker;

  WorkerNavigateToModuleListIconButton(this.worker, {super.key});

  @override
  Widget build(BuildContext context) {
    return PermissionProtected(
      permission: WorkerModulePermissions.managePermissionsKey,
      child: IconButton(
        key: key ?? const Key('WorkerNavigateToModuleListIconButton'),
        icon: const Icon(Icons.security),
        onPressed: () => navigate.toPermissions(worker.uid, canPop: true),
      ),
    );
  }
}

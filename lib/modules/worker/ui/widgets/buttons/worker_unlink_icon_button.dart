import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkerUnlinkIconButton extends GetView<WorkerUnlinkingController> {
  final WorkerModel worker;

  const WorkerUnlinkIconButton(this.worker, {super.key});

  @override
  Widget build(BuildContext context) {
    return PermissionProtected(
      permission: WorkerModulePermissions.unlinkKey,
      child: IconButton(
        key: key ?? const Key('WorkerUnlinkIconButton'),
        icon: const Icon(Icons.person_off),
        onPressed: () => ConfirmationDialog.show(
          context,
          content: '¿Estás seguro de que quieres desvincular a este trabajador?',
          onConfirm: () => controller.submit(worker),
        ),
      ),
    );
  }
}

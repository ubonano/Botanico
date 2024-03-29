import 'package:botanico/modules/worker/module.dart';
import 'package:botanico/ui/custom_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkerListPage extends GetView<LinkedWorkersController> {
  const WorkerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Trabajadores Vinculados',
      body: Obx(
        () => LinkedWorkersList(linkedWorkers: controller.list$.toList()),
      ),
      floatingActionButton: PermissionProtected(
        permission: WorkerPermissions.linkKey,
        child: FloatingActionButton(
          onPressed: () => controller.navigate.toLinkWorker(canPop: true),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

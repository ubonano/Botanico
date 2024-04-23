import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkerListPage extends GetView<WorkerListController> {
  const WorkerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Trabajadores Vinculados',
      body: Obx(() => _buildWorkerList(controller.workerList$.toList())),
      floatingActionButton: WorkerLinkingFAB(),
    );
  }

  Widget _buildWorkerList(List<WorkerModel> list) {
    late final WorkerUnlinkingController unlinkingController = Get.find();

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final WorkerModel worker = list[index];

        return ListTile(
          title: Text(worker.name),
          subtitle: Text(worker.email),
          trailing: worker.isNotOwner && worker.uid != unlinkingController.currentWorker?.uid
              ? _buildTrailingIconButtons(worker, context)
              : null,
        );
      },
    );
  }

  Widget? _buildTrailingIconButtons(WorkerModel worker, BuildContext context) {
    late final NavigationService navigate = Get.find();
    late final WorkerUnlinkingController unlinkingController = Get.find();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PermissionProtected(
          permission: WorkerModulePermissions.unlinkKey,
          child: IconButton(
            icon: const Icon(Icons.person_off),
            onPressed: () => ConfirmationDialog.show(
              context,
              content: '¿Estás seguro de que quieres desvincular a este trabajador?',
              onConfirm: () => unlinkingController.submit(worker),
            ),
          ),
        ),
        PermissionProtected(
          permission: WorkerModulePermissions.managePermissionsKey,
          child: IconButton(
            icon: const Icon(Icons.security),
            onPressed: () => navigate.toPermissions(worker.uid, canPop: true),
          ),
        ),
      ],
    );
  }
}

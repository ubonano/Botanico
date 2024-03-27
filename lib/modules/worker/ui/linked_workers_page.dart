import 'package:botanico/modules/worker/module.dart';
import 'package:botanico/ui/custom_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LinkedWorkersPage extends GetView<LinkedWorkersController> {
  const LinkedWorkersPage({super.key});

  get _list => controller.list$;

  get _title => 'Trabajadores Vinculados';
  get _contentDialogText => '¿Estás seguro de que quieres desvincular a este trabajador?';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: _title,
      body: Obx(
        () => ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, index) {
            final LinkedWorkerModel linkedWorker = _list[index];

            return ListTile(
              title: Text(linkedWorker.name),
              subtitle: Text(linkedWorker.email),
              trailing: _buildTrailingIconButtons(linkedWorker, context),
              // onTap: () => {}, // TODO agregar una pantalla para ver el detalle del trabajador
            );
          },
        ),
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

  Widget? _buildTrailingIconButtons(LinkedWorkerModel linkedWorker, BuildContext context) {
    return linkedWorker.isNotOwner
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PermissionProtected(
                permission: WorkerPermissions.unlinkKey,
                child: IconButton(
                  icon: const Icon(Icons.person_off),
                  onPressed: () => ConfirmationDialog.show(
                    context,
                    content: _contentDialogText,
                    onConfirm: () => controller.unlinkWorker(linkedWorker),
                  ),
                ),
              ),
              PermissionProtected(
                permission: WorkerPermissions.managePermissionsKey,
                child: IconButton(
                  icon: const Icon(Icons.security),
                  onPressed: () => controller.navigate.toPermissions(linkedWorker.uid, canPop: true),
                ),
              ),
            ],
          )
        : null;
  }
}

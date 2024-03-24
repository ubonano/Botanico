import 'package:botanico/models/linked_worker_model.dart';
import 'package:botanico/widgets/confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_scaffold.dart';
import 'linked_workers_controller.dart';

class LinkedWorkersPage extends GetView<LinkedWorkersController> {
  const LinkedWorkersPage({super.key});

  get _list => controller.list$;

  get _title => 'Trabajadores Vinculados';
  get _contentDialogText => '¿Estás seguro de que quieres desvincular a este trabajador?';
  get _hasPermissionToLinkWorker => controller.hasPermissionToLinkWorker;
  get _hasPermissionToUnlinkWorker => controller.hasPermissionToUnlinkWorker;

  void _toLinkWorker() => controller.navigate.toLinkWorker(canPop: true);
  Future<void> _unlinkWorker(LinkedWorkerModel linkedWorker) => controller.unlinkWorker(linkedWorker);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: _title,
      body: Obx(
        () => ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, index) {
            final linkedWorker = _list[index];

            return ListTile(
              title: Text(linkedWorker.name),
              subtitle: Text(linkedWorker.email),
              trailing: _buildUnlinkIconButton(linkedWorker, context),
            );
          },
        ),
      ),
      floatingActionButton: Obx(
        () => _hasPermissionToLinkWorker
            ? FloatingActionButton(onPressed: _toLinkWorker, child: const Icon(Icons.add))
            : Container(),
      ),
    );
  }

  IconButton? _buildUnlinkIconButton(linkedWorker, BuildContext context) {
    return linkedWorker.isNotOwner && _hasPermissionToUnlinkWorker
        ? IconButton(
            icon: const Icon(Icons.person_off),
            onPressed: () => ConfirmationDialog.show(
              context,
              content: _contentDialogText,
              onConfirm: () => _unlinkWorker(linkedWorker),
            ),
          )
        : null;
  }
}

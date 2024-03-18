import 'package:botanico/models/linked_worker_model.dart';
import 'package:botanico/widgets/confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_scaffold.dart';
import 'linked_workers_controller.dart';

class LinkedWorkersPage extends GetView<LinkedWorkersController> {
  const LinkedWorkersPage({super.key});

  int get linkedWorkersLength => controller.linkedWorkers$.length;
  LinkedWorkerModel getLinkedWorker(int index) => controller.linkedWorkers$[index];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Trabajadores Vinculados',
      body: Obx(
        () => ListView.builder(
          itemCount: linkedWorkersLength,
          itemBuilder: (context, index) => _buildListTile(getLinkedWorker(index), context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.navigateToLinkWorker,
        child: const Icon(Icons.add),
      ),
    );
  }

  ListTile _buildListTile(LinkedWorkerModel linkedWorker, BuildContext context) {
    return ListTile(
      title: Text(linkedWorker.name),
      subtitle: Text(linkedWorker.email),
      trailing: !linkedWorker.isOwner
          ? IconButton(
              icon: const Icon(Icons.person_off),
              onPressed: () => _showConfirmationDialog(context, linkedWorker),
            )
          : null,
    );
  }

  void _showConfirmationDialog(BuildContext context, LinkedWorkerModel linkedWorker) {
    return ConfirmationDialog.show(
      context,
      title: 'Confirmar',
      content: '¿Estás seguro de que quieres desvincular a este trabajador?',
      onConfirm: () => controller.unlinkWorker(linkedWorker),
    );
  }
}

import 'package:botanico/models/linked_worker_model.dart';
import 'package:botanico/widgets/confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_scaffold.dart';
import 'linked_workers_controller.dart';

class LinkedWorkersPage extends GetView<LinkedWorkersController> {
  const LinkedWorkersPage({super.key});

  get _list => controller.list$;

  void _toLinkWorker() => controller.navigateToLinkWorker();
  void _unlinkWorker(LinkedWorkerModel linkedWorker) => controller.unlinkWorker(linkedWorker);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Trabajadores Vinculados',
      body: Obx(
        () => ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, index) => _buildListTile(_list[index], context),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _toLinkWorker, child: const Icon(Icons.add)),
    );
  }

  ListTile _buildListTile(LinkedWorkerModel linkedWorker, BuildContext context) {
    return ListTile(
      title: Text(linkedWorker.name),
      subtitle: Text(linkedWorker.email),
      trailing: !linkedWorker.isOwner
          ? IconButton(
              icon: const Icon(Icons.person_off),
              onPressed: () => ConfirmationDialog.show(
                context,
                title: 'Confirmar',
                content: '¿Estás seguro de que quieres desvincular a este trabajador?',
                onConfirm: () => _unlinkWorker(linkedWorker),
              ),
            )
          : null,
    );
  }
}

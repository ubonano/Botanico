import 'package:botanico/models/linked_worker_model.dart';
import 'package:botanico/permissions/permissions.dart';
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

  void _toLinkWorker() => controller.navigate.toLinkWorker(canPop: true);
  Future<void> _unlinkWorker(LinkedWorkerModel linkedWorker) => controller.unlinkWorker(linkedWorker);

  bool get _canLinkWorker => controller.currentWorker!.hasPermission(LinkedWorkerPermissions.link);

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
              trailing: !linkedWorker.isOwner
                  ? IconButton(
                      icon: const Icon(Icons.person_off),
                      onPressed: () => ConfirmationDialog.show(
                        context,
                        content: _contentDialogText,
                        onConfirm: () => _unlinkWorker(linkedWorker),
                      ),
                    )
                  : null,
            );
          },
        ),
      ),
      floatingActionButton:
          _canLinkWorker ? FloatingActionButton(onPressed: _toLinkWorker, child: const Icon(Icons.add)) : null,
    );
  }
}

import 'package:botanico/services/navigation_service.dart';
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

  NavigationService get _navigate => Get.find<NavigationService>();

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
      // TODO refactor con widget de segurida
      floatingActionButton: Obx(
        () => controller.hasPermissionToLinkWorker
            ? FloatingActionButton(onPressed: () => _navigate.toLinkWorker(canPop: true), child: const Icon(Icons.add))
            : Container(),
      ),
    );
  }

// TODO refactor con widget de segurida
  IconButton? _buildUnlinkIconButton(linkedWorker, BuildContext context) {
    return linkedWorker.isNotOwner && controller.hasPermissionToUnlinkWorker
        ? IconButton(
            icon: const Icon(Icons.person_off),
            onPressed: () => ConfirmationDialog.show(
              context,
              content: _contentDialogText,
              onConfirm: () => controller.unlinkWorker(linkedWorker),
            ),
          )
        : null;
  }
}

import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:botanico/ui/widgets/permission_protected.dart';
import 'package:botanico/ui/widgets/confirmation_dialog.dart';

class LinkedWorkersList extends StatelessWidget {
  LinkedWorkersList({Key? key, required this.linkedWorkers}) : super(key: key);

  final List<LinkedWorkerModel> linkedWorkers;
  final WorkerUnlinkingController unlinkingController = Get.find();
  final NavigationService navigate = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: linkedWorkers.length,
      itemBuilder: (context, index) {
        final LinkedWorkerModel linkedWorker = linkedWorkers[index];

        return ListTile(
          title: Text(linkedWorker.name),
          subtitle: Text(linkedWorker.email),
          trailing: linkedWorker.isNotOwner ? _buildTrailingIconButtons(linkedWorker, context) : null,
        );
      },
    );
  }

  Widget? _buildTrailingIconButtons(LinkedWorkerModel linkedWorker, BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PermissionProtected(
          permission: WorkerPermissions.unlinkKey,
          child: IconButton(
            icon: const Icon(Icons.person_off),
            onPressed: () => ConfirmationDialog.show(
              context,
              content: '¿Estás seguro de que quieres desvincular a este trabajador?',
              onConfirm: () => unlinkingController.unlinkWorker(linkedWorker),
            ),
          ),
        ),
        PermissionProtected(
          permission: WorkerPermissions.managePermissionsKey,
          child: IconButton(
            icon: const Icon(Icons.security),
            onPressed: () => navigate.toPermissions(linkedWorker.uid, canPop: true),
          ),
        ),
      ],
    );
  }
}

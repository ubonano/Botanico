import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:botanico/modules/authentication/module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:botanico/ui/widgets/permission_protected.dart';
import 'package:botanico/ui/widgets/confirmation_dialog.dart';

class WorkerList extends StatelessWidget {
  WorkerList({Key? key, required this.list}) : super(key: key);

  final WorkerUnlinkingController _unlinkingController = Get.find();
  final SessionService _session = Get.find();
  final NavigationService _navigate = Get.find();
  final List<LinkedWorkerModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final LinkedWorkerModel linkedWorker = list[index];

        return ListTile(
          title: Text(linkedWorker.name),
          subtitle: Text(linkedWorker.email),
          trailing: linkedWorker.isNotOwner && linkedWorker.uid != _session.worker!.uid
              ? _buildTrailingIconButtons(linkedWorker, context)
              : null,
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
              onConfirm: () => _unlinkingController.unlinkWorker(linkedWorker),
            ),
          ),
        ),
        PermissionProtected(
          permission: WorkerPermissions.managePermissionsKey,
          child: IconButton(
            icon: const Icon(Icons.security),
            onPressed: () => _navigate.toPermissions(linkedWorker.uid, canPop: true),
          ),
        ),
      ],
    );
  }
}

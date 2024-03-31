import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/worker/module.dart';

class WorkerList extends StatelessWidget {
  WorkerList({Key? key, required this.list}) : super(key: key);

  final WorkerUnlinkingController _unlinkingController = Get.find();
  final SessionService _session = Get.find();
  final NavigationService _navigate = Get.find();
  final List<WorkerModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final WorkerModel worker = list[index];

        return ListTile(
          title: Text(worker.name),
          subtitle: Text(worker.email),
          trailing: worker.isNotOwner && worker.uid != _session.worker!.uid
              ? _buildTrailingIconButtons(worker, context)
              : null,
        );
      },
    );
  }

  Widget? _buildTrailingIconButtons(WorkerModel worker, BuildContext context) {
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
              onConfirm: () => _unlinkingController.unlinkWorker(worker),
            ),
          ),
        ),
        PermissionProtected(
          permission: WorkerModulePermissions.managePermissionsKey,
          child: IconButton(
            icon: const Icon(Icons.security),
            onPressed: () => _navigate.toPermissions(worker.uid, canPop: true),
          ),
        ),
      ],
    );
  }
}

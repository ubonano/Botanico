import 'package:botanico/models/linked_worker_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_drawer/custom_drawer.dart';
import 'linked_workers_controller.dart';

class LinkedWorkersPage extends GetView<LinkedWorkersController> {
  const LinkedWorkersPage({super.key});

  int get linkedWorkersLength => controller.linkedWorkers$.length;
  LinkedWorkerModel getLinkedWorker(int index) => controller.linkedWorkers$[index];

  void _onPressedUnlinkWorker(LinkedWorkerModel linkedWorker) {
    controller.unlinkWorker(linkedWorker);
    controller.navigateToBack();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trabajadores Vinculados'),
      ),
      drawer: const CustomDrawer(),
      body: Obx(
        () => ListView.builder(
          itemCount: linkedWorkersLength,
          itemBuilder: (context, index) => _linkedWorkerListTileBuild(getLinkedWorker(index), context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.navigateToLinkWorker,
        child: const Icon(Icons.add),
      ),
    );
  }

  ListTile _linkedWorkerListTileBuild(LinkedWorkerModel linkedWorker, BuildContext context) {
    return ListTile(
      title: Text(linkedWorker.name),
      subtitle: Text(linkedWorker.email),
      trailing: !linkedWorker.isOwner
          ? IconButton(
              icon: const Icon(Icons.person_off),
              onPressed: () => _showUnlinkConfirmation(context, linkedWorker),
            )
          : null,
    );
  }

  void _showUnlinkConfirmation(BuildContext context, LinkedWorkerModel linkedWorker) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar'),
          content: const Text('¿Estás seguro de que quieres desvincular a este trabajador?'),
          actions: <Widget>[
            TextButton(
              onPressed: controller.navigateToBack,
              child: const Text('Cancelar'),
            ),
            TextButton(
              child: const Text('Desvincular'),
              onPressed: () => _onPressedUnlinkWorker(linkedWorker),
            ),
          ],
        );
      },
    );
  }
}

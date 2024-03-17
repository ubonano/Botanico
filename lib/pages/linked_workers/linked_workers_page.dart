import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_drawer/custom_drawer.dart';
import 'linked_workers_controller.dart';

class LinkedWorkersPage extends GetView<LinkedWorkersController> {
  const LinkedWorkersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trabajadores Vinculados'),
      ),
      drawer: const CustomDrawer(),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.linkedWorkers$.length,
          itemBuilder: (context, index) {
            final worker = controller.linkedWorkers$[index];
            return ListTile(
              title: Text(worker.name),
              subtitle: Text(worker.email),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.navigateToLinkWorker,
        child: const Icon(Icons.add),
      ),
    );
  }
}

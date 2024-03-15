import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_drawer/custom_drawer.dart';
import 'workers_controller.dart';

class WorkersPage extends GetView<WorkersController> {
  const WorkersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trabajadores Vinculados'),
      ),
      drawer: const CustomDrawer(),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.workers.length,
          itemBuilder: (context, index) {
            // final worker = controller.workers[index];
            return const ListTile(
              title: Text('worker.name'),
              subtitle: Text('worker.email'),
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

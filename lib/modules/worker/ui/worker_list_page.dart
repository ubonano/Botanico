import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkerListPage extends GetView<WorkerListController> {
  const WorkerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Trabajadores Vinculados',
      body: Obx(
        () => WorkerList(list: controller.workerList$.toList()),
      ),
      floatingActionButton: WorkerLinkingFAB(),
    );
  }
}

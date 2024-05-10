import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkerListPage extends GetView<WorkerListController> {
  const WorkerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('workerListPage'),
      title: 'Trabajadores Vinculados',
      drawer: CustomDrawer(),
      body: Obx(() => WorkerList(controller.linkedWorkerList$.toList())),
      floatingActionButton: WorkerLinkFAB(),
    );
  }
}

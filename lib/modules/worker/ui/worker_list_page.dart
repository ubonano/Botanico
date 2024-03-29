import 'package:botanico/modules/worker/module.dart';
import 'package:botanico/ui/custom_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkerListPage extends GetView<WorkerListController> {
  const WorkerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Trabajadores Vinculados',
      body: Obx(
        () => WorkerList(list: controller.linkedWorkerList$.toList()),
      ),
      floatingActionButton: WorkerLinkingFAB(),
    );
  }
}

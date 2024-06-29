import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/ui.dart';
import '../../ui.dart';

class WorkerPermissionManagementPage extends GetView<WorkerPermissionManagementController> {
  const WorkerPermissionManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('WorkerPermissionManagementPage'),
      title: 'Gestión de Permisos',
      drawer: null,
      body: Obx(() => ListView(children: controller.modules$.map((module) => ModuleExpansionTile(module)).toList())),
    );
  }
}

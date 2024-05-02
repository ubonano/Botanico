import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModuleListPage extends GetView<ModuleListController> {
  const ModuleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('ModuleListPage'),
      title: 'Gestión de Permisos',
      drawer: null,
      body: Obx(() => ListView(children: controller.modules$.map((module) => ModuleExpansionTile(module)).toList())),
    );
  }
}

import 'package:botanico/modules/worker/module.dart';
import 'package:botanico/ui/custom_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkerManagementPage extends GetView<WorkerManagementPermissionsController> {
  const WorkerManagementPage({super.key});

  get _title => 'Gestión de Permisos'; // TODO agregar nombre del trabajador

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: _title,
      drawer: null,
      body: Obx(
        () {
          return ListView(
            children: controller.modules$.map((module) {
              return ExpansionTile(
                title: Text(module.name),
                children: module.permissions.map((permission) {
                  return CheckboxListTile(
                    title: Text(permission.name),
                    value: controller.worker?.permissions[permission.id] ?? false,
                    onChanged: (bool? value) => controller.togglePermission(permission.id),
                  );
                }).toList(),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

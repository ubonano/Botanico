import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_scaffold.dart';
import 'worker_permissions_controller.dart';

class PermissionsScreen extends GetView<PermissionsController> {
  const PermissionsScreen({super.key});

  get _title => 'Gestión de Permisos';

  @override
  Widget build(BuildContext context) {
    controller.logTag;

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

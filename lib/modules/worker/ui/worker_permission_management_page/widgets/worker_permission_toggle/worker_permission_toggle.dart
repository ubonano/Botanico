import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/model/permission_model.dart';
import '../../../ui.dart';

class WorkerPermissionToggle extends GetView<WorkerPermissionToggleController> {
  final PermissionModel permission;

  const WorkerPermissionToggle(this.permission, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return CheckboxListTile(
          title: Text(permission.name),
          value: controller.worker$?.permissions[permission.id] ?? false,
          onChanged: (bool? value) => controller.togglePermission(permission.id),
        );
      },
    );
  }
}

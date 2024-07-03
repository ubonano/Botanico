import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../app/content/model/key_model.dart';
import '../../../../ui.dart';

class WorkerPermissionToggle extends GetView<WorkerPermissionToggleController> {
  final KeyModel permission;

  const WorkerPermissionToggle(this.permission, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return CheckboxListTile(
          title: Text(permission.label),
          value: controller.worker$?.permissions[permission.id] ?? false,
          onChanged: (bool? value) => controller.togglePermission(permission.id),
        );
      },
    );
  }
}

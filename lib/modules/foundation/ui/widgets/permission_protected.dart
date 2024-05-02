import 'package:botanico/modules/worker/worker_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PermissionProtected extends StatelessWidget {
  final Widget child;
  final String permission;

  const PermissionProtected({super.key, required this.permission, required this.child});

  @override
  Widget build(BuildContext context) {
    // TODO refactor... no debe acceder directo al handler
    late final WorkerHandler workerHandler = Get.find();

    return Obx(() => workerHandler.loggedWorker$?.hasPermission(permission) ?? false ? child : const SizedBox.shrink());
  }
}

import 'package:botanico/modules/worker/worker_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PermissionProtected extends StatelessWidget {
  final Widget child;
  final String permission;

  const PermissionProtected({super.key, required this.permission, required this.child});

  @override
  Widget build(BuildContext context) {
    final WorkerRepository workerRepo = Get.find();

    return Obx(() => workerRepo.currentWorker$?.hasPermission(permission) ?? false ? child : const SizedBox.shrink());
  }
}

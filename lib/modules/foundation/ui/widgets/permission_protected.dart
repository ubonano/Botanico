import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/worker/module.dart';

class PermissionProtected extends StatelessWidget {
  final Widget child;
  final String permission;

  const PermissionProtected({super.key, required this.permission, required this.child});

  @override
  Widget build(BuildContext context) {
    // TODO refactor... no debe acceder directo al handler
    late final IWorkerBusinessLogic _workerBusinessLogic = Get.find();

    return Obx(
        () => _workerBusinessLogic.loggedWorker$?.hasPermission(permission) ?? false ? child : const SizedBox.shrink());
  }
}

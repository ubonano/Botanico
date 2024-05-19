import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/worker/module.dart';

class ProtectedWidget extends StatelessWidget {
  final Widget child;
  final String permission;

  const ProtectedWidget({super.key, required this.permission, required this.child});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Get.find<IWorkerBusinessLogic>().loggedWorker$?.hasPermission(permission) ?? false
          ? child
          : const SizedBox.shrink(),
    );
  }
}

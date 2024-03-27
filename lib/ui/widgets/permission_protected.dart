import 'package:botanico/modules/authentication/services/session_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PermissionProtected extends StatelessWidget {
  final Widget child;
  final String permission;

  const PermissionProtected({super.key, required this.permission, required this.child});

  @override
  Widget build(BuildContext context) {
    final sessionController = Get.find<SessionService>();

    final hasPermission = sessionController.worker?.hasPermission(permission) ?? false;

    return hasPermission ? child : const SizedBox.shrink();
  }
}

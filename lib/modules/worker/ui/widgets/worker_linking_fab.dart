import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:botanico/ui/custom_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../module.dart';

class WorkerLinkingFAB extends StatelessWidget {
  WorkerLinkingFAB({super.key});

  final NavigationService navigate = Get.find();

  @override
  Widget build(BuildContext context) {
    return PermissionProtected(
      permission: WorkerPermissions.linkKey,
      child: FloatingActionButton(
        onPressed: () => navigate.toLinkingWorker(canPop: true),
        child: const Icon(Icons.add),
      ),
    );
  }
}

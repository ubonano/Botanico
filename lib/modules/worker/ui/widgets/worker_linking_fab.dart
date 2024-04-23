import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../module.dart';

class WorkerLinkingFAB extends StatelessWidget {
  WorkerLinkingFAB({super.key});

  final NavigationService _navigate = Get.find();

  @override
  Widget build(BuildContext context) {
    return PermissionProtected(
      permission: WorkerModulePermissions.linkKey,
      child: FloatingActionButton(
        onPressed: () => _navigate.toLinkingWorker(canPop: true),
        child: const Icon(Icons.add),
      ),
    );
  }
}

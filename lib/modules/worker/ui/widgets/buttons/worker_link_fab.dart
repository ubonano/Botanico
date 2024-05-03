import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../worker_module.dart';

class WorkerLinkFAB extends StatelessWidget {
  const WorkerLinkFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return PermissionProtected(
      permission: WorkerModulePermissions.linkKey,
      child: FloatingActionButton(
        key: key ?? const Key('WorkerLinkFAB'),
        onPressed: () => Get.find<NavigationHelper>().toLinkingWorker(canPop: true),
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../module.dart';

class WorkerLinkFAB extends StatelessWidget with NavigationHelperInstance {
  WorkerLinkFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      module: WorkerModulePermissions().toModel(),
      permission: WorkerModulePermissions.linkKey,
      child: FloatingActionButton(
        key: key ?? const Key('WorkerLinkFAB'),
        onPressed: () => navigate.toLinkingWorker(canPop: true),
        child: const Icon(Icons.add),
      ),
    );
  }
}

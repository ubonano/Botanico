import 'package:flutter/material.dart';
import 'package:botanico/modules/company/module.dart';

import '../../../module.dart';

class WorkerLinkFAB extends StatelessWidget with NavigationHelperInstance {
  WorkerLinkFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      module: WorkerModule(),
      permission: WorkerModule.linkKey,
      child: FloatingActionButton(
        key: key ?? const Key('WorkerLinkFAB'),
        onPressed: () => navigate.toLinkingWorker(canPop: true),
        child: const Icon(Icons.add),
      ),
    );
  }
}

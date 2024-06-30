import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/ui/ui.dart';
import '../../../../content/setup/permissions.dart';
import '../../../ui.dart';

class WorkerLinkFAB extends StatelessWidget {
  const WorkerLinkFAB({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<WorkerPermissions>();

    return ProtectedWidget(
      module: module,
      permission: module.linkKey,
      child: FloatingActionButton(
        key: key ?? const Key('WorkerLinkFAB'),
        onPressed: () => WorkerLinkPage.navigate(canPop: true),
        child: const Icon(Icons.add),
      ),
    );
  }
}

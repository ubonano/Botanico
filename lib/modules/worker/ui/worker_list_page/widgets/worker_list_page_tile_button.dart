import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../company/helpers/navigation_helper.dart';
import '../../../../company/ui/ui.dart';
import '../../../setup/permissions.dart';

class WorkerListPageTileButton extends StatelessWidget with NavigationHelperInstance {
  WorkerListPageTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<WorkerPermissions>();

    return ProtectedWidget(
      key: key ?? const Key('WorkerListPageTileButton'),
      module: module,
      permission: module.viewKey,
      child: ListTile(
        leading: const Icon(Icons.work),
        title: const Text('Trabajadores'),
        onTap: navigate.toWorkerList,
      ),
    );
  }
}

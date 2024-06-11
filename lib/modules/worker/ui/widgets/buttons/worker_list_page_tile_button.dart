import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/material.dart';

import '../../../module.dart';

class WorkerListPageTileButton extends StatelessWidget with NavigationHelperInstance {
  WorkerListPageTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      key: key ?? const Key('WorkerListPageTileButton'),
      module: WorkerModulePermissions().toModel(),
      permission: WorkerModulePermissions.viewKey,
      child: ListTile(
        leading: const Icon(Icons.work),
        title: const Text('Trabajadores'),
        onTap: navigate.toWorkerList,
      ),
    );
  }
}

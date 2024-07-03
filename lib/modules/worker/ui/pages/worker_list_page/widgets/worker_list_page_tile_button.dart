import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/ui/ui.dart';
import '../../../../content/setup/module.dart';
import '../../../ui.dart';

class WorkerListPageTileButton extends StatelessWidget {
  const WorkerListPageTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<WorkerModule>();

    return ProtectedWidget(
      key: key ?? const Key('WorkerListPageTileButton'),
      module: module,
      permission: WorkerKeys.view.id,
      child: const ListTile(
        leading: Icon(Icons.work),
        title: Text('Trabajadores'),
        onTap: WorkerListPage.navigate,
      ),
    );
  }
}

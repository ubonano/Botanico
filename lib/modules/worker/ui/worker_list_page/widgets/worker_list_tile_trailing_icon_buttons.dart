import 'package:flutter/material.dart';

import '../../../module.dart';

class WorkerListTileTrailingIconButtons extends StatelessWidget {
  final WorkerModel worker;

  const WorkerListTileTrailingIconButtons(this.worker, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        WorkerUnlinkIconButton(worker),
        WorkerNavigateToModuleListIconButton(worker),
      ],
    );
  }
}

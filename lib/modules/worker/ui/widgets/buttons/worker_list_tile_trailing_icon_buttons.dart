import 'package:botanico/modules/worker/module.dart';
import 'package:flutter/material.dart';

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

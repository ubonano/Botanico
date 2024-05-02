import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:flutter/material.dart';

class ModuleExpansionTile extends StatelessWidget {
  final ModuleModel module;

  const ModuleExpansionTile(this.module, {super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(module.name),
      children: module.permissions.map((permission) => WorkerPermissionToggle(permission)).toList(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:botanico/modules/company/module.dart';

import '../../ui.dart';

class ModuleExpansionTile extends StatelessWidget {
  final IPermissionsStructure module;

  const ModuleExpansionTile(this.module, {super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(module.name),
      children: module.permissions.map((permission) => WorkerPermissionToggle(permission)).toList(),
    );
  }
}

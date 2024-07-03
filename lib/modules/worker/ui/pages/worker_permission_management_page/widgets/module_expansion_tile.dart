import 'package:flutter/material.dart';

import '../../../../../app/content/setup/interfaces/i_module_structure.dart';
import '../../../ui.dart';

class ModuleExpansionTile extends StatelessWidget {
  final IModuleStructure module;

  const ModuleExpansionTile(this.module, {super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(module.label),
      children: module.keys.map((permission) => WorkerPermissionToggle(permission)).toList(),
    );
  }
}

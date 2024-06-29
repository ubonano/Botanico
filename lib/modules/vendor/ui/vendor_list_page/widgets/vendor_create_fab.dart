import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/ui/navigation.dart';
import '../../../../app/ui/ui.dart';
import '../../../content/setup/permissions.dart';

class VendorCreateFAB extends StatelessWidget with AppNavigationInstance {
  VendorCreateFAB({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<VendorPermissions>();

    return ProtectedWidget(
      module: module,
      permission: module.createKey,
      child: FloatingActionButton(
        key: key ?? const Key('VendorCreateFAB'),
        onPressed: () => navigate.toVendorForm(canPop: true),
        child: const Icon(Icons.add),
      ),
    );
  }
}

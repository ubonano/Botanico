import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../company/helpers/navigation_helper.dart';
import '../../../../company/ui/ui.dart';
import '../../../setup/permissions.dart';

class VendorCreateFAB extends StatelessWidget with NavigationHelperInstance {
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

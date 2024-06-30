import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../app/ui/ui.dart';
import '../../../../setup/permissions.dart';
import '../../../ui.dart';

class VendorCreateFAB extends StatelessWidget {
  const VendorCreateFAB({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<VendorPermissions>();

    return ProtectedWidget(
      module: module,
      permission: module.createKey,
      child: FloatingActionButton(
        key: key ?? const Key('VendorCreateFAB'),
        onPressed: () => VendorListPage.navigate(canPop: true),
        child: const Icon(Icons.add),
      ),
    );
  }
}

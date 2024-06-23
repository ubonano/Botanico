import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../company/helpers/navigation_helper.dart';
import '../../../../company/ui/ui.dart';
import '../../../setup/permissions.dart';

class VendorListPageTileButton extends StatelessWidget with NavigationHelperInstance {
  VendorListPageTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<VendorPermissions>();

    return ProtectedWidget(
      key: key ?? const Key('VendorListPageTileButton'),
      module: module,
      permission: module.viewKey,
      child: ListTile(
        leading: const Icon(Icons.local_shipping),
        title: const Text('Proveedores'),
        onTap: navigate.toVendorList,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../module.dart';

class VendorListPageTileButton extends StatelessWidget with NavigationHelperInstance {
  VendorListPageTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      permission: VendorModulePermissions.viewKey,
      child: ListTile(
        leading: const Icon(Icons.local_shipping),
        title: const Text('Proveedores'),
        onTap: navigate.toVendorList,
      ),
    );
  }
}

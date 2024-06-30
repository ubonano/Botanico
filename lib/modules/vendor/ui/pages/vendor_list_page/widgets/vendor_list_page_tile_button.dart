import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../../app/ui/ui.dart';
import '../../../../setup/permissions.dart';
import '../../../ui.dart';

class VendorListPageTileButton extends StatelessWidget {
  const VendorListPageTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<VendorPermissions>();

    return ProtectedWidget(
      key: key ?? const Key('VendorListPageTileButton'),
      module: module,
      permission: module.viewKey,
      child: const ListTile(
        leading: Icon(Icons.local_shipping),
        title: Text('Proveedores'),
        onTap: VendorListPage.navigate,
      ),
    );
  }
}

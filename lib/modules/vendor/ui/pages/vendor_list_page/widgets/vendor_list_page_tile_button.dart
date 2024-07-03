import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../../app/ui/ui.dart';
import '../../../../setup/module.dart';
import '../../../ui.dart';

class VendorListPageTileButton extends StatelessWidget {
  const VendorListPageTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<VendorModule>();

    return ProtectedWidget(
      key: key ?? const Key('VendorListPageTileButton'),
      module: module,
      permission: VendorKeys.view.id,
      child: const ListTile(
        leading: Icon(Icons.local_shipping),
        title: Text('Proveedores'),
        onTap: VendorListPage.navigate,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../module.dart';

class ViaShipmentListPageTileButton extends StatelessWidget with NavigationHelperInstance {
  ViaShipmentListPageTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      key: key ?? const Key('ViaShipmentListPageTileButton'),
      permission: ViaShipmentModulePermissions.viewKey,
      child: ListTile(
        leading: const Icon(Icons.local_shipping),
        title: const Text('Via Shipments'),
        onTap: navigate.toViaShipmentList,
      ),
    );
  }
}


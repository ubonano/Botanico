import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../../module.dart';

class ViaShipmentListPageTileButton extends StatelessWidget with NavigationHelperInstance {
  ViaShipmentListPageTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedWidget(
      key: key ?? const Key('ViaShipmentListPageTileButton'),
      module: ViaShipmentModulePermissions().toModel(),
      permission: ViaShipmentModulePermissions.viewKey,
      child: ExpansionTile(
        leading: const Icon(Icons.local_shipping),
        title: const Text('Via Shipments'),
        children: [
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Lista de Envíos'),
            onTap: navigate.toViaShipmentList,
          ),
          ProtectedWidget(
            key: const Key('ViaShipmentDashboardTileButton'),
            module: ViaShipmentModulePermissions().toModel(),
            permission: ViaShipmentModulePermissions.viewKey,
            child: ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard de Envíos'),
              onTap: navigate.toViaShipmentDashboard,
            ),
          ),
        ],
      ),
    );
  }
}

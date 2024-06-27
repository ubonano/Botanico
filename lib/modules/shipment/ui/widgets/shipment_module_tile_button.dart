import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../app/content/setup/navigation.dart';
import '../../../app/ui/ui.dart';
import '../../content/setup/permissions.dart';

class ShipmentModuleTileButton extends StatelessWidget with NavigationHelperInstance {
  ShipmentModuleTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<ShipmentPermissions>();

    return ProtectedWidget(
      key: key ?? const Key('ShipmentCabinetPageTileButton'),
      module: module,
      child: ExpansionTile(
        leading: const Icon(Icons.local_shipping),
        title: const Text('Envíos'),
        children: [
          ProtectedWidget(
            key: const Key('ShipmentCabinetTileButton'),
            module: module,
            permission: module.cabinetKey,
            child: ListTile(
              leading: const Icon(Icons.archive),
              title: const Text('Archivo'),
              onTap: navigate.toShipmentCabinet,
            ),
          ),
          ProtectedWidget(
            key: const Key('ShipmentDashboardTileButton'),
            module: module,
            permission: module.dashboardKey,
            child: ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: navigate.toShipmentDashboard,
            ),
          ),
        ],
      ),
    );
  }
}

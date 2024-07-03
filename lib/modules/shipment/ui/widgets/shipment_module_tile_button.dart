import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../app/ui/ui.dart';
import '../../setup/module.dart';
import '../ui.dart';

class ShipmentModuleTileButton extends StatelessWidget {
  const ShipmentModuleTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<ShipmentModule>();

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
            permission: ShipmentKeys.cabinet.id,
            child: const ListTile(
              leading: Icon(Icons.archive),
              title: Text('Archivo'),
              onTap: ShipmentCabinetPage.navigate,
            ),
          ),
          ProtectedWidget(
            key: const Key('ShipmentDashboardTileButton'),
            module: module,
            permission: ShipmentKeys.dashboard.id,
            child: const ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              onTap: ShipmentDashboardPage.navigate,
            ),
          ),
        ],
      ),
    );
  }
}

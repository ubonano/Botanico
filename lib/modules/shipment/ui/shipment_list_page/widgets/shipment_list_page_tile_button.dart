import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/content/setup/navigation.dart';
import '../../../../app/ui/ui.dart';
import '../../../content/setup/permissions.dart';

class ShipmentListPageTileButton extends StatelessWidget with NavigationHelperInstance {
  ShipmentListPageTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<ShipmentPermissions>();

    return ProtectedWidget(
      key: key ?? const Key('ShipmentListPageTileButton'),
      module: module,
      permission: module.viewKey,
      child: ExpansionTile(
        leading: const Icon(Icons.local_shipping),
        title: const Text('Envíos'),
        children: [
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Lista de Envíos'),
            onTap: navigate.toShipmentList,
          ),
          ProtectedWidget(
            key: const Key('ShipmentDashboardTileButton'),
            module: module,
            permission: module.viewKey,
            child: ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard de Envíos'),
              onTap: navigate.toShipmentDashboard,
            ),
          ),
        ],
      ),
    );
  }
}

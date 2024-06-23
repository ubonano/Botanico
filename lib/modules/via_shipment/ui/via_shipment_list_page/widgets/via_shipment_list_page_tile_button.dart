import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../company/helpers/navigation_helper.dart';
import '../../../../company/ui/ui.dart';
import '../../../setup/permissions.dart';

class ViaShipmentListPageTileButton extends StatelessWidget with NavigationHelperInstance {
  ViaShipmentListPageTileButton({super.key});

  @override
  Widget build(BuildContext context) {
    final module = Get.find<ViaShipmentPermissions>();

    return ProtectedWidget(
      key: key ?? const Key('ViaShipmentListPageTileButton'),
      module: module,
      permission: module.viewKey,
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
            module: module,
            permission: module.viewKey,
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

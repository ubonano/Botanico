import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../module.dart';

class ViaShipmentDashboardPage extends GetView<ViaShipmentDashboardController> {
  const ViaShipmentDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('ViaShipmentDashboardPage'),
      title: 'Dashboard de Envíos',
      drawer: CustomDrawer(),
      body: Obx(
        () {
          var list = controller.list$.toList();

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, index) {
              final ViaShipmentModel viaShipment = list[index];
              return Card(child: ViaShipmentDashboardTile(viaShipment));
            },
          );
        },
      ),
      floatingActionButton: ViaShipmentCreateFAB(),
    );
  }
}

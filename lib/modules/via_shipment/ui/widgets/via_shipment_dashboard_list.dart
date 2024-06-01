import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../module.dart';

class ViaShipmentDashboardList extends GetView<ViaShipmentDashboardController> with NavigationHelperInstance {
  ViaShipmentDashboardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
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
    );
  }
}

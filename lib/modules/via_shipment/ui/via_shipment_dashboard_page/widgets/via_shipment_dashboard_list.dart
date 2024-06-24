import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/content/setup/navigation.dart';
import '../../ui.dart';

class ViaShipmentDashboardList extends GetView<ViaShipmentDashboardController> with NavigationHelperInstance {
  ViaShipmentDashboardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var list = controller.list$.toList();

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) => Card(child: ViaShipmentDashboardTile(list[index])),
        );
      },
    );
  }
}

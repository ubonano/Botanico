import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/ui/navigation.dart';
import '../../../ui.dart';

class ShipmentDashboardList extends GetView<ShipmentDashboardController> with AppNavigationInstance {
  ShipmentDashboardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var list = controller.list$.toList();

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) => Card(child: ShipmentDashboardTile(list[index])),
        );
      },
    );
  }
}

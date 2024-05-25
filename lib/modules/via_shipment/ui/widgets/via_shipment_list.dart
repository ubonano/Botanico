import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../module.dart';

class ViaShipmentList extends GetView<ViaShipmentListController> with NavigationHelperInstance {
  ViaShipmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var list = controller.viaShipmentList$.toList();

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) {
            final ViaShipmentModel viaShipment = list[index];

            return Card(
              child: ListTile(
                title: ViaShipmentListTileTitle(viaShipment),
                trailing: ViaShipmentListTileTrailing(viaShipment),
                onTap: () => navigate.toViaShipmentForm(id: viaShipment.id, canPop: true),
              ),
            );
          },
        );
      },
    );
  }
}

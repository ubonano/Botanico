import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/content/setup/navigation.dart';
import '../../ui.dart';

class ViaShipmentList extends GetView<ViaShipmentListController> with NavigationHelperInstance {
  ViaShipmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var list = controller.list$.toList();

        return ListView.builder(
          controller: controller.scrollController,
          itemCount: list.length,
          itemBuilder: (_, index) => Card(child: ViaShipmentListTile(list[index])),
        );
      },
    );
  }
}

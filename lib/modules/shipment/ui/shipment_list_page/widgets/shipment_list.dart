import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/content/setup/navigation.dart';
import '../../ui.dart';

class ShipmentList extends GetView<ShipmentListController> with NavigationHelperInstance {
  ShipmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var list = controller.list$.toList();

        return ListView.builder(
          controller: controller.scrollController,
          itemCount: list.length,
          itemBuilder: (_, index) => Card(child: ShipmentListTile(list[index])),
        );
      },
    );
  }
}

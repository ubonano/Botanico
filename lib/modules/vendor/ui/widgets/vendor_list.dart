import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../module.dart';

class VendorList extends GetView<VendorListController> with NavigationHelperInstance {
  VendorList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var list = controller.list$.toList();

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) {
            final VendorModel vendor = list[index];

            return ListTile(
              title: Text(vendor.name),
              trailing: VendorListTileTrailingIconButtons(vendor),
              onTap: () => navigate.toVendorForm(id: vendor.uid, canPop: true),
            );
          },
        );
      },
    );
  }
}

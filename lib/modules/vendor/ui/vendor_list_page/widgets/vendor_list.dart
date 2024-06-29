import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/navigation.dart';
import '../../../content/model/vendor_model.dart';
import '../../ui.dart';

class VendorList extends GetView<VendorListController> with AppNavigationInstance {
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

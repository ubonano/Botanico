import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../module.dart';

class VendorList extends GetView<VendorListController> with NavigationHelperInstance {
  final List<VendorModel> list;

  VendorList(this.list, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final VendorModel vendor = list[index];

        return ListTile(
          title: Text(vendor.name),
          trailing: VendorListTileTrailingIconButtons(vendor),
          onTap: () => navigate.toVendorForm(id: vendor.uid, canPop: true),
        );
      },
    );
  }
}

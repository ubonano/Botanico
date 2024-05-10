import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../module.dart';

class VendorList extends GetView<VendorListController> {
  final List<VendorModel> list;

  const VendorList(this.list, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final VendorModel vendor = list[index];

        return ListTile(title: Text(vendor.name));
      },
    );
  }
}

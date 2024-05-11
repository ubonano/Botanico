import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../module.dart';

class VendorListPage extends GetView<VendorListController> {
  const VendorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('VendorListPage'),
      drawer: CustomDrawer(),
      title: 'Proveedores',
      body: Obx(() => VendorList(controller.vendorList$.toList())),
      floatingActionButton: VendorCreateFAB(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';

import '../ui.dart';

class VendorListPage extends GetView<VendorListController> {
  const VendorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('VendorListPage'),
      drawer: CustomDrawer(),
      title: 'Proveedores',
      body: VendorList(),
      floatingActionButton: VendorCreateFAB(),
    );
  }
}

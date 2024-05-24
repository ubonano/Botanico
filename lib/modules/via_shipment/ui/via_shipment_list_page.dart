import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../module.dart';

class ViaShipmentListPage extends GetView<ViaShipmentListController> {
  const ViaShipmentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('ViaShipmentListPage'),
      drawer: CustomDrawer(),
      title: 'Via Shipments',
      body: ViaShipmentList(),
      floatingActionButton: ViaShipmentCreateFAB(),
    );
  }
}


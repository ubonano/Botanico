import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/ui/ui.dart';
import '../ui.dart';

class ViaShipmentListPage extends GetView<ViaShipmentListController> {
  const ViaShipmentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('ViaShipmentListPage'),
      title: 'Via Shipments',
      drawer: CustomDrawer(),
      body: Column(
        children: [
          const ViaShipmentFilters(),
          Expanded(child: ViaShipmentList()),
        ],
      ),
      floatingActionButton: ViaShipmentCreateFAB(),
    );
  }
}

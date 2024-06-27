import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/ui/ui.dart';
import '../ui.dart';

class ShipmentListPage extends GetView<ShipmentListController> {
  const ShipmentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('ShipmentListPage'),
      title: 'Envios',
      drawer: CustomDrawer(),
      body: Column(
        children: [
          const ShipmentFilters(),
          Expanded(child: ShipmentList()),
        ],
      ),
      floatingActionButton: ShipmentCreateFAB(),
    );
  }
}

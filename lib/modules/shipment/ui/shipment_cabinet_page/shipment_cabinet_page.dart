import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/ui/ui.dart';
import '../ui.dart';

class ShipmentCabinetPage extends GetView<ShipmentCabinetController> {
  const ShipmentCabinetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('ShipmentCabinetPage'),
      title: 'Archivo de envios',
      drawer: CustomDrawer(),
      body: Column(
        children: [
          const ShipmentCabinetFilters(),
          Expanded(child: ShipmentList()),
        ],
      ),
      floatingActionButton: ShipmentCreateFAB(),
    );
  }
}

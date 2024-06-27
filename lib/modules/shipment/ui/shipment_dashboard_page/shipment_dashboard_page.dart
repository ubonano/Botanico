import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/ui/ui.dart';
import '../ui.dart';

class ShipmentDashboardPage extends GetView<ShipmentDashboardController> {
  const ShipmentDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('ShipmentDashboardPage'),
      title: 'Dashboard de Envíos',
      drawer: CustomDrawer(),
      body: ShipmentDashboardList(),
      floatingActionButton: ShipmentCreateFAB(),
    );
  }
}

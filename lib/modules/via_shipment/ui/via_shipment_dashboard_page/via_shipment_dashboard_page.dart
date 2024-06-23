import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../company/ui/ui.dart';
import '../ui.dart';

class ViaShipmentDashboardPage extends GetView<ViaShipmentDashboardController> {
  const ViaShipmentDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('ViaShipmentDashboardPage'),
      title: 'Dashboard de Envíos',
      drawer: CustomDrawer(),
      body: ViaShipmentDashboardList(),
      floatingActionButton: ViaShipmentCreateFAB(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/ui.dart';
import '../../../../authentication/ui/middlewares.dart';
import '../../../../worker/ui/middlewares.dart';
import '../../ui.dart';

class ShipmentDashboardPage extends GetView<ShipmentDashboardController> {
  const ShipmentDashboardPage({super.key});

  static navigate({String argument = '', bool canPop = false}) =>
      Get.find<AppNavigation>().to(route, arguments: argument, canPop: canPop);

  static const String route = '/shipment-dashboard';

  static GetPage get page => GetPage(
        name: route,
        page: () => const ShipmentDashboardPage(),
        middlewares: [
          AuthMiddleware(),
          HasWorkerMiddleware(),
          IsEmployedOrOwnerMiddleware(),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('ShipmentDashboardPage'),
      title: 'Dashboard de Envíos',
      drawer: const CustomDrawer(),
      body: const ShipmentDashboardList(),
      floatingActionButton: const ShipmentCreateFAB(),
    );
  }
}

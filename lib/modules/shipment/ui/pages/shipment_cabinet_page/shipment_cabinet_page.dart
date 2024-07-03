import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/ui/ui.dart';
import '../../../../authentication/ui/middlewares.dart';
import '../../../../worker/ui/middlewares.dart';
import '../../../setup/module.dart';
import '../../ui.dart';

class ShipmentCabinetPage extends GetView<ShipmentCabinetController> {
  const ShipmentCabinetPage({super.key});

  static navigate({String argument = '', bool canPop = false}) =>
      Get.find<AppNavigation>().to(route, arguments: argument, canPop: canPop);

  static const String route = '/shipment-cabinet';

  static GetPage get page => GetPage(
        name: route,
        page: () => const ShipmentCabinetPage(),
        middlewares: [
          AuthMiddleware(),
          HasWorkerMiddleware(),
          IsEmployedOrOwnerMiddleware(),
          AccessMiddleware(ShipmentModule.moduleId, [ShipmentKeys.cabinet.id]),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      key: key ?? const Key('ShipmentCabinetPage'),
      title: 'Archivo de envios',
      drawer: const CustomDrawer(),
      body: const Column(
        children: [
          ShipmentCabinetFilters(),
          Expanded(child: ShipmentList()),
        ],
      ),
      floatingActionButton: const ShipmentCreateFAB(),
    );
  }
}

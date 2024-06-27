// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../../ui/ui.dart';

mixin ShipmentNavigation {
  static const SHIPMENT_FORM = '/shipment-form';
  static const SHIPMENT_CABINET = '/shipment-cabinet';
  static const SHIPMENT_DASHBOARD = '/shipment-dashboard';

  void toShipmentCabinet({bool canPop = false}) => to(SHIPMENT_CABINET, canPop: canPop);
  void toShipmentForm({String id = '', bool canPop = false}) => to(SHIPMENT_FORM, arguments: id, canPop: canPop);
  void toShipmentDashboard({bool canPop = false}) => to(SHIPMENT_DASHBOARD, canPop: canPop);

  void to(String route, {dynamic arguments, bool canPop = false});
}

final pages = [
  GetPage(
    name: ShipmentNavigation.SHIPMENT_FORM,
    page: () => const ShipmentFormPage(),
  ),
  GetPage(
    name: ShipmentNavigation.SHIPMENT_CABINET,
    page: () => const ShipmentCabinetPage(),
  ),
  GetPage(
    name: ShipmentNavigation.SHIPMENT_DASHBOARD,
    page: () => const ShipmentDashboardPage(),
  ),
];

// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../../ui/ui.dart';

mixin ViaShipmentNavigation {
  static const VIA_SHIPMENT_FORM = '/via-shipment-form';
  static const VIA_SHIPMENT_LIST = '/via-shipment-list';
  static const VIA_SHIPMENT_DASHBOARD = '/via-shipment-dashboard';

  void toShipmentList({bool canPop = false}) => to(VIA_SHIPMENT_LIST, canPop: canPop);
  void toShipmentForm({String id = '', bool canPop = false}) => to(VIA_SHIPMENT_FORM, arguments: id, canPop: canPop);
  void toShipmentDashboard({bool canPop = false}) => to(VIA_SHIPMENT_DASHBOARD, canPop: canPop);

  void to(String route, {dynamic arguments, bool canPop = false});
}

final pages = [
  GetPage(
    name: ViaShipmentNavigation.VIA_SHIPMENT_FORM,
    page: () => const ShipmentFormPage(),
  ),
  GetPage(
    name: ViaShipmentNavigation.VIA_SHIPMENT_LIST,
    page: () => const ShipmentListPage(),
  ),
  GetPage(
    name: ViaShipmentNavigation.VIA_SHIPMENT_DASHBOARD,
    page: () => const ShipmentDashboardPage(),
  ),
];

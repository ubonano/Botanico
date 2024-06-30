// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../../authentication/ui/middlewares.dart';
import '../../worker/ui/middlewares.dart';
import 'ui.dart';

mixin VendorNavigation {
  static const VENDOR_FORM = '/vendor-form';
  static const VENDOR_LIST = '/vendor-list';

  void toVendorList({bool canPop = false}) => to(VENDOR_LIST, canPop: canPop);
  void toVendorForm({String id = '', bool canPop = false}) => to(VENDOR_FORM, arguments: id, canPop: canPop);

  void to(String route, {dynamic arguments, bool canPop = false});
}

final pages = [
  GetPage(
    name: VendorNavigation.VENDOR_FORM,
    page: () => const VendorFormPage(),
    middlewares: [
      AuthMiddleware(),
      HasWorkerMiddleware(),
      IsEmployedOrOwnerMiddleware(),
    ],
  ),
  GetPage(
    name: VendorNavigation.VENDOR_LIST,
    page: () => const VendorListPage(),
    middlewares: [
      AuthMiddleware(),
      HasWorkerMiddleware(),
      IsEmployedOrOwnerMiddleware(),
    ],
  ),
];

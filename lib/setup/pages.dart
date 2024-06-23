// ignore_for_file: library_prefixes

import 'package:get/get.dart';
import 'package:botanico/modules/accounting_account/setup/navigation.dart' as AccountingAccount;
import 'package:botanico/modules/authentication/setup/navigation.dart' as Authentication;
import 'package:botanico/modules/vendor/setup/navigation.dart' as Vendor;
import 'package:botanico/modules/via_shipment/setup/navigation.dart' as ViaShipment;
import 'package:botanico/modules/worker/setup/navigation.dart' as Worker;
import 'package:botanico/modules/company/module.dart';

class Pages {
  static final pages = [
    GetPage(
      name: CompanyNavigationHelper.EMPTY,
      page: () => const HomePage(),
    ),
    GetPage(
      name: CompanyNavigationHelper.COMPANY_FORM,
      page: () => const CompanyFormPage(),
    ),
    GetPage(
      name: CompanyNavigationHelper.HOME,
      page: () => const HomePage(),
    ),
    ...Authentication.pages,
    ...Worker.pages,
    ...Vendor.pages,
    ...AccountingAccount.pages,
    ...ViaShipment.pages,
  ];
}

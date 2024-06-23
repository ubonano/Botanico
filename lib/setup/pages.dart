// ignore_for_file: library_prefixes

import 'package:get/get.dart';
import 'package:botanico/modules/accounting_account/setup/navigation.dart' as AccountingAccount;
import 'package:botanico/modules/authentication/setup/navigation.dart' as Authentication;
import 'package:botanico/modules/vendor/setup/navigation.dart' as Vendor;
import 'package:botanico/modules/via_shipment/setup/navigation.dart' as ViaShipment;
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/worker/module.dart';

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
    // + Worker
    GetPage(
      name: WorkerNavigationHelper.WORKER_CREATE,
      page: () => const WorkerFormPage(),
    ),
    GetPage(
      name: WorkerNavigationHelper.WORKER_LIST,
      page: () => const WorkerListPage(),
    ),
    GetPage(
      name: WorkerNavigationHelper.WORKER_LINKING,
      page: () => const WorkerLinkPage(),
    ),
    GetPage(
      name: WorkerNavigationHelper.WORKER_PERMISSIONS,
      page: () => const WorkerPermissionManagementPage(),
    ),
    GetPage(
      name: WorkerNavigationHelper.LOBBY,
      page: () => const LobbyPage(),
    ),
    // - Worker
    ...Vendor.pages,
    ...AccountingAccount.pages,
    ...ViaShipment.pages,
  ];
}

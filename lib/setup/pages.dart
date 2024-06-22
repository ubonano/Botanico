import 'package:botanico/modules/accounting_account/module.dart';
import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/vendor/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:botanico/modules/via_shipment/module.dart';
import 'package:get/get.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.EMPTY,
      page: () => const HomePage(),
    ),
    GetPage(
      name: CompanyNavigationHelper.COMPANY_FORM,
      page: () => const CompanyFormPage(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AuthenticationNavigateHelper.SIGN_IN,
      page: () => const SignInPage(),
    ),
    GetPage(
      name: AuthenticationNavigateHelper.SIGN_UP,
      page: () => const SignUpPage(),
    ),
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
    // + Vendor
    GetPage(
      name: VendorNavigationHelper.VENDOR_FORM,
      page: () => const VendorFormPage(),
    ),
    GetPage(
      name: VendorNavigationHelper.VENDOR_LIST,
      page: () => const VendorListPage(),
    ),
    // - Vendor
    GetPage(
      name: AccountingAccountNavigationHelper.ACCOUNTING_ACCOUNT_FORM,
      page: () => const AccountingAccountFormPage(),
    ),
    GetPage(
      name: AccountingAccountNavigationHelper.ACCOUNTING_ACCOUNT_LIST,
      page: () => const AccountingAccountListPage(),
    ),
    // + Via Shipment
    GetPage(
      name: ViaShipmentNavigationHelper.VIA_SHIPMENT_FORM,
      page: () => const ViaShipmentFormPage(),
    ),
    GetPage(
      name: ViaShipmentNavigationHelper.VIA_SHIPMENT_LIST,
      page: () => const ViaShipmentListPage(),
    ),
    GetPage(
      name: ViaShipmentNavigationHelper.VIA_SHIPMENT_DASHBOARD,
      page: () => const ViaShipmentDashboardPage(),
    ),
    // - Via Shipment
  ];
}

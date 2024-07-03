// ignore_for_file: library_prefixes

import 'package:get/get.dart';

import 'package:botanico/modules/app/content/setup/module.dart';
import 'package:botanico/modules/authentication/setup/module.dart';
import 'package:botanico/modules/company/setup/module.dart';
import 'package:botanico/modules/worker/content/setup/module.dart';
import 'package:botanico/modules/vendor/setup/module.dart';
import 'package:botanico/modules/accounting_account/setup/module.dart';
import 'package:botanico/modules/shipment/setup/module.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    ApplicationModule.dependencies();
    AuthenticationModule.dependencies();
    CompanyModule.dependencies();
    WorkerModule.dependencies();
    VendorModule.dependencies();
    AccountingAccountModule.dependencies();
    ShipmentModule.dependencies();
  }
}

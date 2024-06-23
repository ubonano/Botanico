// ignore_for_file: library_prefixes

import 'package:botanico/modules/authentication/setup/dependencies.dart' as auth;
import 'package:botanico/modules/company/setup/dependencies.dart' as company;
import 'package:botanico/modules/worker/setup/dependencies.dart' as worker;
import 'package:botanico/modules/vendor/setup/dependencies.dart' as vendor;
import 'package:botanico/modules/accounting_account/setup/dependencies.dart' as accountingAccount;
import 'package:botanico/modules/via_shipment/setup/dependencies.dart' as viaShipment;

import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    auth.setupDependencies();
    worker.setupDependencies();
    company.setupDependencies();
    vendor.setupDependencies();
    accountingAccount.setupDependencies();
    viaShipment.setupDependencies();
  }
}

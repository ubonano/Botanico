// ignore_for_file: library_prefixes

import 'package:get/get.dart';

import 'package:botanico/modules/app/content/setup/dependencies.dart' as app;
import 'package:botanico/modules/authentication/setup/dependencies.dart' as auth;
import 'package:botanico/modules/company/content/setup/dependencies.dart' as company;
import 'package:botanico/modules/worker/content/setup/dependencies.dart' as worker;
import 'package:botanico/modules/vendor/content/setup/dependencies.dart' as vendor;
import 'package:botanico/modules/accounting_account/setup/dependencies.dart' as accountingAccount;
import 'package:botanico/modules/shipment/content/setup/dependencies.dart' as shipment;

class AppBindings extends Bindings {
  @override
  void dependencies() {
    app.setupDependencies();
    auth.setupDependencies();
    company.setupDependencies();
    worker.setupDependencies();
    vendor.setupDependencies();
    accountingAccount.setupDependencies();
    shipment.setupDependencies();
  }
}

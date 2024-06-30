// ignore_for_file: depend_on_referenced_packages

import 'package:integration_test/integration_test.dart';

import 'package:botanico/modules/authentication/setup/tests/module_test.dart' as authentication;
import 'package:botanico/modules/company/setup/tests/module_test.dart' as company;
import 'package:botanico/modules/worker/content/tests/module_test.dart' as worker;
import 'package:botanico/modules/vendor/content/tests/module_test.dart' as vendor;
import 'package:botanico/modules/accounting_account/setup/tests/module_test.dart' as accountingAccount;
import 'package:botanico/modules/shipment/content/tests/module_test.dart' as shipment;

/* 

-To run execute:

flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=lib/tests/app_test.dart \
  -d chrome

*/

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  authentication.runTests();
  company.runTests();
  worker.runTests();
  vendor.runTests();
  accountingAccount.runTests();
  shipment.runTests();
}

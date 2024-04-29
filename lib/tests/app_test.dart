// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/company/company_test.dart';
import 'package:botanico/modules/worker/worker_test.dart';
import 'package:integration_test/integration_test.dart';

/* 

-To run execute:

flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=lib/tests/app_test.dart \
  -d chrome

*/

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  authenticationTests();
  workerTests();
  companyTests();
}

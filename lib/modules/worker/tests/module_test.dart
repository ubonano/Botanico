// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:integration_test/integration_test.dart';

/* 
-To run execute:

flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=lib/modules/worker/module_test.dart \
  -d chrome

*/

void runTests() => main();

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  _workerCreateTesting();
}

void _workerCreateTesting() {
  createWorkerEmptyFieldsTest(generateRandomEmail(), 'password123');
  createWorkerInvalidBirthdateTest(generateRandomEmail(), 'password123');
  createWorkerInvalidPhoneTest(generateRandomEmail(), 'password123');
  createWorkerInvalidDNITest(generateRandomEmail(), 'password123');
  createWorkerSuccessFromSignUpTest(generateRandomEmail(), 'password123');
  createWorkerSuccessFromSignInTest(generateRandomEmail(), 'password123');
}

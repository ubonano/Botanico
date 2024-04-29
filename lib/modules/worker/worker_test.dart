// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:integration_test/integration_test.dart';

/* 
-To run execute:

flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=lib/modules/worker/tests/worker_test.dart \
  -d chrome

*/

void workerTests() => main();

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  _workerCreateTesting();
}

void _workerCreateTesting() {
  createWorkerWithEmptyFieldsTest(generateRandomEmail(), 'password123');
  createWorkerWithInvalidBirthdateTest(generateRandomEmail(), 'password123');
  createWorkerWithInvalidPhoneTest(generateRandomEmail(), 'password123');
  createWorkerWithInvalidDNITest(generateRandomEmail(), 'password123');
  createWorkerSuccessFromSignUpTest(generateRandomEmail(), 'password123');
  createWorkerSuccessFromSignInTest(generateRandomEmail(), 'password123');
}

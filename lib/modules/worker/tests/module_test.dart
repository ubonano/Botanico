// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/company/module.dart';

import 'package:integration_test/integration_test.dart';

import 'worker_create/worker_create_empty_fields_test.dart';
import 'worker_create/worker_create_invalid_birthdate_format_test.dart';
import 'worker_create/worker_create_invalid_dni_format_test.dart';
import 'worker_create/worker_create_invalid_phone_format_test.dart';
import 'worker_create/worker_create_success_from_sign_in_test.dart';
import 'worker_create/worker_create_success_from_sign_up_test.dart';

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

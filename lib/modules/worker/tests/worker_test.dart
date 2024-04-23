// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/foundation/module.dart';
import 'package:integration_test/integration_test.dart';

import 'worker_create/worker_create_empty_fields_test.dart';
import 'worker_create/worker_create_wrong_birthdate_format_test.dart';
import 'worker_create/worker_create_wrong_phone_format_test.dart';
import 'worker_create/worker_create_wrong_dni_format_test.dart';
import 'worker_create/worker_create_success_from_sign_up_test.dart';

/* 
-To run execute:

flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=lib/modules/worker/tests/worker_test.dart \
  -d chrome

*/

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
}

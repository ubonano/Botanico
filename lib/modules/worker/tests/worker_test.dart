// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/foundation/module.dart';
import 'package:integration_test/integration_test.dart';
import 'worker_create/worker_create_empty_fields_test.dart' as worker_create_empty_fields_test;
import 'worker_create/worker_create_success_test.dart' as worker_create_success_test;
import 'worker_create/worker_create_wrong_birthdate_format_test.dart' as worker_create_wrong_birthdate_format_test;
import 'worker_create/worker_create_wrong_phone_format_test.dart' as worker_create_wrong_phone_format_test;
import 'worker_create/worker_create_wrong_dni_format_test.dart' as worker_create_wrong_dni_format_test;

/* 

Tu run execute:
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=lib/modules/worker/tests/worker_test.dart \
  -d chrome

*/

//Probar test y hacer refactor de los mismos
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  worker_create_empty_fields_test.main([generateRandomEmail(), 'password123']);
  worker_create_wrong_birthdate_format_test.main([generateRandomEmail(), 'password123']);
  worker_create_wrong_phone_format_test.main([generateRandomEmail(), 'password123']);
  worker_create_wrong_dni_format_test.main([generateRandomEmail(), 'password123']);
  worker_create_success_test.main([generateRandomEmail(), 'password123']);
}

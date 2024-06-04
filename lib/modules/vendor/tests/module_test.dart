// ignore_for_file: depend_on_referenced_packages

import 'package:integration_test/integration_test.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../module.dart';

/* 
-To run execute:

flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=lib/modules/vendor/tests/module_test.dart \
  -d chrome

*/

void runTests() => main();

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  _vendorCreateTesting();
  _vendorListTesting();
  _vendorUpdateTesting();
  _vendorDeleteTesting();
}

void _vendorCreateTesting() {
  vendorCreateEmptyFieldsFromSignUpTest(generateRandomEmail(), 'password123');
  vendorCreateInvalidCuitTest(generateRandomEmail(), 'password123');
  vendorCreateInvalidPhoneTest(generateRandomEmail(), 'password123');
  vendorCreateSuccessFromSignUpTest(generateRandomEmail(), 'password123');
}

void _vendorListTesting() {
  vendorListFindByNameTest(generateRandomEmail(), 'password123');
  vendorListFindAndVerifyDetailsTest(generateRandomEmail(), 'password123');
}

void _vendorUpdateTesting() {
  vendorUpdateAndVerifyDetailsTest(generateRandomEmail(), 'password123');
}

void _vendorDeleteTesting() {
  vendorDeleteTest(generateRandomEmail(), 'password123');
}

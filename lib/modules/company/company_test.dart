// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:integration_test/integration_test.dart';

/* 

-To run execute:

flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=lib/modules/company/company_test.dart \
  -d chrome

*/

void companyTests() => main();

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  createCompanyWithEmptyFieldsTest(generateRandomEmail(), 'password123');
  createCompanyWithInvalidPhoneTest(generateRandomEmail(), 'password123');
  createCompanySuccessFromSignUpTest(generateRandomEmail(), 'password123');
  createCompanySuccessFromSignInTest(generateRandomEmail(), 'password123');
}

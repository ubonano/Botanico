// ignore_for_file: depend_on_referenced_packages

import 'package:integration_test/integration_test.dart';

import '../../app/helpers/function_helper.dart';
import 'company_create/company_create_empty_fields_test.dart';
import 'company_create/company_create_invalid_phone_format_test.dart';
import 'company_create/company_create_success_from_sign_in_test.dart';
import 'company_create/company_create_success_from_sign_up_test.dart';

/* 

-To run execute:

flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=lib/modules/company/tests/module_test.dart \
  -d chrome

*/

void runTests() => main();

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  companyCreateEmptyFieldsTest(generateRandomEmail(), 'password123');
  companyCreateInvalidPhoneTest(generateRandomEmail(), 'password123');
  companyCreateSuccessFromSignUpTest(generateRandomEmail(), 'password123');
  companyCreateSuccessFromSignInTest(generateRandomEmail(), 'password123');
}

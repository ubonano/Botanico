// ignore_for_file: depend_on_referenced_packages

import 'package:integration_test/integration_test.dart';

import '../../company/helpers/function_helper.dart';
import 'vendor_create/vendor_create_success_test.dart';
import 'vendor_create/vendor_empty_fields_test.dart';
import 'vendor_create/vendor_invalid_cuit_test.dart';
import 'vendor_create/vendor_invalid_phone_test.dart';
import 'vendor_delete/vendor_delete_test.dart';
import 'vendor_list/vendor_list_find_by_name_test.dart';
import 'vendor_list/vendor_list_find_enter_validate_all_fields_test.dart';
import 'vendor_update/vendor_update_success_test.dart';

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

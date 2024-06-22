// ignore_for_file: depend_on_referenced_packages

import 'package:integration_test/integration_test.dart';
import 'package:botanico/modules/company/module.dart';

import '../module.dart';

/* 
-To run execute:

flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=lib/modules/accounting_account/tests/module_test.dart \
  -d chrome

*/

void runTests() => main();

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  _accountingAccountCreateTesting();
  _accountingAccountListTesting();
  _accountingAccountUpdateTesting();
  _accountingAccountDeleteTesting();
}

void _accountingAccountCreateTesting() {
  accountingAccountCreateEmptyFieldsFromSignUpTest(generateRandomEmail(), 'password123');
  accountingAccountCreateSuccessFromSignUpTest(generateRandomEmail(), 'password123');
}

void _accountingAccountListTesting() {
  accountingAccountListFindByNameTest(generateRandomEmail(), 'password123');
  accountingAccountListFindAndVerifyDetailsTest(generateRandomEmail(), 'password123');
}

void _accountingAccountUpdateTesting() {
  accountingAccountUpdateAndVerifyDetailsTest(generateRandomEmail(), 'password123');
}

void _accountingAccountDeleteTesting() {
  accountingAccountDeleteTest(generateRandomEmail(), 'password123');
}

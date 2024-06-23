// ignore_for_file: depend_on_referenced_packages

import 'package:integration_test/integration_test.dart';

import '../../company/helpers/function_helper.dart';
import 'accounting_account_create/accounting_account_create_success_test.dart';
import 'accounting_account_create/accounting_account_empty_fields_test.dart';
import 'accounting_account_delete/accounting_account_delete_test.dart';
import 'accounting_account_list/accounting_account_list_find_by_name_test.dart';
import 'accounting_account_list/accounting_account_list_find_enter_validate_all_fields_test.dart';
import 'accounting_account_update/accounting_account_update_success_test.dart';

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

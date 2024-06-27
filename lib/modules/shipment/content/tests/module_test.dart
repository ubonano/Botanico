// ignore_for_file: depend_on_referenced_packages

import 'package:integration_test/integration_test.dart';

import '../../../app/content/helpers/function_helper.dart';
import 'shipment_create/shipment_create_success_test.dart';
import 'shipment_delete/shipment_delete_test.dart';
import 'shipment_list/shipment_list_find_by_name_test.dart';
import 'shipment_list/shipment_list_find_enter_validate_all_fields_test.dart';
import 'shipment_update/shipment_update_success_test.dart';

/* 
-To run execute:

flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=lib/modules/shipment/tests/module_test.dart \
  -d chrome
*/

void runTests() => main();

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  _shipmentCreateTesting();
  _shipmentListTesting();
  _shipmentUpdateTesting();
  _shipmentDeleteTesting();
}

void _shipmentCreateTesting() {
  shipmentCreateSuccessFromSignUpTest(generateRandomEmail(), 'password123');
}

void _shipmentListTesting() {
  shipmentListFindByNameTest(generateRandomEmail(), 'password123');
  shipmentListFindAndVerifyDetailsTest(generateRandomEmail(), 'password123');
}

void _shipmentUpdateTesting() {
  shipmentUpdateAndVerifyDetailsTest(generateRandomEmail(), 'password123');
}

void _shipmentDeleteTesting() {
  shipmentDeleteTest(generateRandomEmail(), 'password123');
}

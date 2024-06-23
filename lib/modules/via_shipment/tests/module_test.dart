// ignore_for_file: depend_on_referenced_packages

import 'package:integration_test/integration_test.dart';

import '../../app/helpers/function_helper.dart';
import 'via_shipment_create/via_shipment_create_success_test.dart';
import 'via_shipment_delete/via_shipment_delete_test.dart';
import 'via_shipment_list/via_shipment_list_find_by_name_test.dart';
import 'via_shipment_list/via_shipment_list_find_enter_validate_all_fields_test.dart';
import 'via_shipment_update/via_shipment_update_success_test.dart';

/* 
-To run execute:

flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=lib/modules/via_shipment/tests/module_test.dart \
  -d chrome
*/

void runTests() => main();

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  _viaShipmentCreateTesting();
  // _viaShipmentListTesting();
  // _viaShipmentUpdateTesting();
  // _viaShipmentDeleteTesting();
}

void _viaShipmentCreateTesting() {
  // viaShipmentCreateEmptyFieldsFromSignUpTest(generateRandomEmail(), 'password123');
  viaShipmentCreateSuccessFromSignUpTest(generateRandomEmail(), 'password123');
}

void _viaShipmentListTesting() {
  viaShipmentListFindByNameTest(generateRandomEmail(), 'password123');
  viaShipmentListFindAndVerifyDetailsTest(generateRandomEmail(), 'password123');
}

void _viaShipmentUpdateTesting() {
  viaShipmentUpdateAndVerifyDetailsTest(generateRandomEmail(), 'password123');
}

void _viaShipmentDeleteTesting() {
  viaShipmentDeleteTest(generateRandomEmail(), 'password123');
}

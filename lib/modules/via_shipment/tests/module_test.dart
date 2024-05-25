// ignore_for_file: depend_on_referenced_packages

import 'package:integration_test/integration_test.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../module.dart';

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

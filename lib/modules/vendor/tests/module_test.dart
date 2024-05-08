// ignore_for_file: depend_on_referenced_packages

import 'package:integration_test/integration_test.dart';

/* 
-To run execute:

flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=lib/modules/worker/module_test.dart \
  -d chrome

*/

void runTests() => main();

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  _vendorCreateTesting();
}

void _vendorCreateTesting() {}

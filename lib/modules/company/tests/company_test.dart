// ignore_for_file: depend_on_referenced_packages

import 'package:integration_test/integration_test.dart';
import '../../foundation/aux/utils.dart';
import 'company_create/company_create_empty_fields_test.dart' as company_create_empty_fields_test;
import 'company_create/company_create_wrong_phone_format_test.dart' as company_create_wrong_phone_format_test;
import 'company_create/company_create_success_test.dart' as company_create_success_test;

/* 

Tu run execute:
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=lib/modules/company/tests/company_test.dart \
  -d chrome

*/

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  company_create_empty_fields_test.main([generateRandomEmail(), 'password123']);
  company_create_wrong_phone_format_test.main([generateRandomEmail(), 'password123']);
  company_create_success_test.main([generateRandomEmail(), 'password123']);
}

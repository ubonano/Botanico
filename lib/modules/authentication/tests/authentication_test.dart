// ignore_for_file: depend_on_referenced_packages

import 'package:integration_test/integration_test.dart';

import '../../foundation/aux/utils.dart';
import 'sign_in/sign_in_navigate_to_sign_in_test.dart' as sign_in_navigate_to_sign_in_test;
import 'sign_in/sign_in_empty_fields_test.dart' as sign_in_empty_fields_test;
import 'sign_in/sign_in_invalid_email_test.dart' as sign_in_invalid_email_test;
import 'sign_in/sign_in_invalid_password_test.dart' as sign_in_invalid_password_test;
import 'sign_in/sign_in_success_test.dart' as sign_in_success_test;
import 'sign_in/sign_in_wrong_password_test.dart' as sign_in_wrong_password_test;
import 'sign_out/sign_in_sign_out_test.dart' as sign_in_sign_out_test;

import 'sign_up/sign_up_navigate_to_sign_in_test.dart' as sign_up_navigate_to_sign_in_test;
import 'sign_up/sign_up_empty_fields_test.dart' as sign_up_empty_fields;
import 'sign_up/sign_up_invalid_email_test.dart' as sign_up_invalid_email_test;
import 'sign_up/sign_up_invalid_password_test.dart' as sign_up_invalid_password_test;
import 'sign_up/sign_up_invalid_confirm_password_test.dart' as sign_up_invalid_confirm_password_test;
import 'sign_up/sign_up_success_test.dart' as sign_up_success_test;
import 'sign_up/sign_up_used_email_test.dart' as sign_up_used_email_test;

/* 

Tu run execute:
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=lib/modules/authentication/tests/authentication_test.dart \
  -d chrome

*/

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final email = generateRandomEmail();
  const password = 'password123';

  _signUpTesting(email, password);
  _signInTesting(email, password);
}

void _signUpTesting(String email, String password) {
  sign_up_navigate_to_sign_in_test.main();
  sign_up_empty_fields.main();
  sign_up_invalid_email_test.main();
  sign_up_invalid_password_test.main();
  sign_up_invalid_confirm_password_test.main();
  sign_up_success_test.main([email, password]);
  sign_up_used_email_test.main([email, password]);
}

void _signInTesting(String email, String password) {
  sign_in_navigate_to_sign_in_test.main();
  sign_in_empty_fields_test.main();
  sign_in_invalid_email_test.main();
  sign_in_invalid_password_test.main();
  sign_in_success_test.main([email, password]);
  sign_in_wrong_password_test.main([email]);
  sign_in_sign_out_test.main([email, password]);
}

// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/foundation/module.dart';
import 'package:integration_test/integration_test.dart';

import 'sign_in/sign_in_navigate_to_sign_in_test.dart';
import 'sign_in/sign_in_empty_fields_test.dart';
import 'sign_in/sign_in_invalid_email_test.dart';
import 'sign_in/sign_in_invalid_password_test.dart';
import 'sign_in/sign_in_success_test.dart';
import 'sign_in/sign_in_wrong_password_test.dart';
import 'sign_out/sign_in_sign_out_test.dart';

import 'sign_up/sign_up_navigate_to_sign_in_test.dart';
import 'sign_up/sign_up_empty_fields_test.dart';
import 'sign_up/sign_up_invalid_email_test.dart';
import 'sign_up/sign_up_invalid_password_test.dart';
import 'sign_up/sign_up_invalid_confirm_password_test.dart';
import 'sign_up/sign_up_success_test.dart';
import 'sign_up/sign_up_used_email_test.dart';

/* 

-To run execute:

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
  signUpNavigateToSignInTest();
  signUpWithEmtyFieldsTest();
  signUpWithInvalidEmailTest();
  signUpWithInvalidPasswordTest();
  signUpWithWrongPasswordConfirmTest();
  signUpSuccessTest(email, password);
  signUpWithEmailAlreadyUsedTest(email, password);
}

void _signInTesting(String email, String password) {
  signInNavigateToSignUpTest();
  signInWithEmptyFieldsTest();
  signInWithInvalidEmailTest();
  signInWithInvalidPasswordTest();
  signInSuccessByNewUserTest(email, password);
  signInWithWrongPassowrdTest(email);
  signOutFromWorkerCreatePageTest(email, password);
}

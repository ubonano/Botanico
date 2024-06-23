// ignore_for_file: depend_on_referenced_packages

import 'package:integration_test/integration_test.dart';

import '../../../app/helpers/function_helper.dart';
import 'pages/sign_in/sign_in_empty_fields_test.dart';
import 'pages/sign_in/sign_in_invalid_email_test.dart';
import 'pages/sign_in/sign_in_invalid_password_test.dart';
import 'pages/sign_in/sign_in_navigate_sign_up_test.dart';
import 'pages/sign_in/sign_in_success_test.dart';
import 'pages/sign_in/sign_in_wrong_password_test.dart';
import 'pages/sign_out/sign_out_test.dart';
import 'pages/sign_up/sign_up_already_used_email_test.dart';
import 'pages/sign_up/sign_up_empty_fields_test.dart';
import 'pages/sign_up/sign_up_invalid_confirm_password_test.dart';
import 'pages/sign_up/sign_up_invalid_email_test.dart';
import 'pages/sign_up/sign_up_invalid_password_test.dart';
import 'pages/sign_up/sign_up_navigate_sign_in_test.dart';
import 'pages/sign_up/sign_up_success_test.dart';

/* 

-To run execute:

flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=lib/modules/authentication/tests/module_test.dart \
  -d chrome

*/

void runTests() => main();

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final email = generateRandomEmail();
  const password = 'password123';

  _signUpTesting(email, password);
  _signInTesting(email, password);
}

void _signUpTesting(String email, String password) {
  signUpNavigateSignInTest();
  signUpEmtyFieldsTest();
  signUpInvalidEmailTest();
  signUpInvalidPasswordTest();
  signUpWrongPasswordConfirmTest();
  signUpSuccessTest(email, password);
  signUpEmailAlreadyUsedTest(email, password);
}

void _signInTesting(String email, String password) {
  signInNavigateSignUpTest();
  signInEmptyFieldsTest();
  signInInvalidEmailTest();
  signInInvalidPasswordTest();
  signInSuccessByNewUserTest(email, password);
  signInWrongPassowrdTest(email);
  signOutFromWorkerCreatePageTest(email, password);
}

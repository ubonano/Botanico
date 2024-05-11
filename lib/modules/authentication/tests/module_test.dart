// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/foundation/module.dart';
import 'package:integration_test/integration_test.dart';

import '../module.dart';

/* 

-To run execute:

flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=lib/modules/authentication/module_test.dart \
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

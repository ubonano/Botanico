// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:integration_test/integration_test.dart';

/* 

-To run execute:

flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=lib/modules/authentication/authentication_test.dart \
  -d chrome

*/

void authenticationTests() => main();

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

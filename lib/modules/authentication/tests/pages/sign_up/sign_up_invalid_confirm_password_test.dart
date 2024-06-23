// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';

import '../../../../app/tests/flows/app_init_flow.dart';
import '../../flows/sign_up_flow.dart';

void signUpWrongPasswordConfirmTest() {
  testWidgets('Sign up with wrong password confirm', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, '', 'password123', 'password');
    expect(find.text('Las contraseñas no coinciden'), findsOneWidget);
  });
}

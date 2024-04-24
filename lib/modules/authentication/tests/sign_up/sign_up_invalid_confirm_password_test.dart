// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter_test/flutter_test.dart';

void signUpWithWrongPasswordConfirmTest() {
  testWidgets('Sign up with wrong password confirm', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, '', 'password123', 'password');
    expect(find.text('Las contraseñas no coinciden'), findsOneWidget);
  });
}

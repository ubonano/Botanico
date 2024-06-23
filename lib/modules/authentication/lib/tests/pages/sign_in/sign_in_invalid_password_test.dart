// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';

import '../../../../../app/tests/flows/app_init_flow.dart';
import '../../flows/sign_in_flow.dart';

void signInInvalidPasswordTest() {
  testWidgets('Sign in with invalid password', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signInFlow(tester, '', '123');
    expect(find.text('La contraseña debe tener al menos 6 caracteres'), findsOneWidget);
  });
}

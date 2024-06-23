// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';

import '../../../../../tests/flows/app_init_flow.dart';
import '../../flows/sign_up_flow.dart';

void signUpInvalidPasswordTest() {
  testWidgets('Sign up with invalid password', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, '', '123', '');
    expect(find.text('La contraseña debe tener al menos 6 caracteres'), findsOneWidget);
  });
}

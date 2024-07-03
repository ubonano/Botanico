// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';

import '../../../../../app/content/tests/flows/app_init_flow.dart';
import '../../flows/sign_in_flow.dart';

void signInWrongPassowrdTest(String email) {
  testWidgets('Sign in with wrong password', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signInFlow(tester, email, 'wrongPassword');
    expect(find.text('La contraseña es incorrecta.'), findsOneWidget);
  });
}

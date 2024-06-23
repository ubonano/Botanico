// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';

import '../../../../../app/tests/flows/app_init_flow.dart';
import '../../flows/sign_in_flow.dart';

void signInInvalidEmailTest() {
  testWidgets('Sign in with invalid email', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signInFlow(tester, 'invalid-email', 'Password123');
    expect(find.text('Ingresa un email válido'), findsOneWidget);
  });
}

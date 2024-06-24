// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';

import '../../../../../app/content/tests/flows/app_init_flow.dart';
import '../../flows/sign_up_flow.dart';

void signUpInvalidEmailTest() {
  testWidgets('Sign up with invalid email', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, 'invalid-email', '', '');
    expect(find.text('Ingresa un email válido'), findsOneWidget);
  });
}

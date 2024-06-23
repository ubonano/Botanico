// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';

import '../../../../app/tests/flows/app_init_flow.dart';
import '../../flows/sign_up_flow.dart';

void signUpEmailAlreadyUsedTest(String email, String password) {
  testWidgets('Sign up with email already used', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, email, password, password);
    expect(find.text('El email ya está en uso por otra cuenta.'), findsOneWidget);
  });
}

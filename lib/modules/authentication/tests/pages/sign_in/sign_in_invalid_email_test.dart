// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/company/module.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../module.dart';

void signInInvalidEmailTest() {
  testWidgets('Sign in with invalid email', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signInFlow(tester, 'invalid-email', 'Password123');
    expect(find.text('Ingresa un email válido'), findsOneWidget);
  });
}

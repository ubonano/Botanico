// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../module.dart';

void signUpEmailAlreadyUsedTest(String email, String password) {
  testWidgets('Sign up with email already used', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, email, password, password);
    expect(find.text('El email ya está en uso por otra cuenta.'), findsOneWidget);
  });
}

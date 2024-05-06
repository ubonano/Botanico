// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter_test/flutter_test.dart';

void signInWithWrongPassowrdTest(String email) {
  testWidgets('Sign in with wrong password', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signInFlow(tester, email, 'wrongPassword');
    expect(find.text('La contraseña es incorrecta.'), findsOneWidget);
  });
}

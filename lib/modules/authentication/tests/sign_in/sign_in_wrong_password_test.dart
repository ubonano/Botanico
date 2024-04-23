// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../authentication_module.dart';

void signInWithWrongPassowrdTest(String email) => main([email]);

void main(List<String> args) {
  testWidgets('Sign in with wrong password', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signInFlow(tester, args[0], 'wrongPassword');
    expect(find.text('La contraseña es incorrecta.'), findsOneWidget);
  });
}

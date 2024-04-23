// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../authentication_module.dart';

void signUpWithInvalidPasswordTest() => main();

void main() {
  testWidgets('Sign up with invalid password', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, '', '123', '');
    expect(find.text('La contraseña debe tener al menos 6 caracteres'), findsOneWidget);
  });
}

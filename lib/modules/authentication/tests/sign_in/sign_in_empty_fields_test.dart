// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:flutter_test/flutter_test.dart';

void signInWithEmptyFieldsTest() {
  testWidgets('Sign in with empty fields', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signInFlow(tester, '', '');
    expect(find.text('Este campo es obligatorio'), findsWidgets);
  });
}

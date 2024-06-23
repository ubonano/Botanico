// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/company/module.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../flows/sign_in_flow.dart';

void signInEmptyFieldsTest() {
  testWidgets('Sign in with empty fields', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signInFlow(tester, '', '');
    expect(find.text('Este campo es obligatorio'), findsWidgets);
  });
}

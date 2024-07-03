// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';

import '../../../../../app/content/tests/flows/app_init_flow.dart';
import '../../flows/sign_in_flow.dart';

void signInEmptyFieldsTest() {
  testWidgets('Sign in with empty fields', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signInFlow(tester, '', '');
    expect(find.text('Este campo es obligatorio'), findsWidgets);
  });
}

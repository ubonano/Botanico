// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';

import '../../../../../tests/flows/app_init_flow.dart';
import '../../flows/sign_up_flow.dart';

void signUpEmtyFieldsTest() {
  testWidgets('Sing up with empty fields', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, '', '', '');
    expect(find.text('Este campo es obligatorio'), findsNWidgets(3));
  });
}

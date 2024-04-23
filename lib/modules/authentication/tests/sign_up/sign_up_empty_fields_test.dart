// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../authentication_module.dart';

void signUpWithEmtyFieldsTest() => main();

void main() {
  testWidgets('Sing up with empty fields', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, '', '', '');
    expect(find.text('Este campo es obligatorio'), findsNWidgets(3));
  });
}

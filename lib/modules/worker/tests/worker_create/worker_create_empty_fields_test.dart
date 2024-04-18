// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../authentication/tests/sign_up/sign_up_success_test.dart';

void main(List<String> args) {
  testWidgets('Validacion de campos vacios', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    await signUpUser(tester, args[0], args[1]);

    final saveButton = find.byKey(const Key('saveWorkerButton'));

    await tester.tap(saveButton);
    await tester.pumpAndSettle();

    expect(find.text('Este campo es obligatorio'), findsNWidgets(4));
  });
}

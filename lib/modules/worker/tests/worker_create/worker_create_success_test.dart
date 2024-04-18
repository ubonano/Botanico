// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../authentication/tests/sign_up/sign_up_success_test.dart';

void main(List<String> args) {
  testWidgets('Creacion de trabajador exitosa', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    await signUpUser(tester, args[0], args[1]);

    final Finder nameField = find.byKey(const Key('fullnameField'));
    final Finder birthdateField = find.byKey(const Key('birthdateField'));
    final Finder phoneField = find.byKey(const Key('phoneField'));
    final Finder dniField = find.byKey(const Key('dniField'));
    final Finder saveWorkerButton = find.byKey(const Key('saveWorkerButton'));

    await tester.enterText(nameField, "John Doe");
    await tester.enterText(birthdateField, "01/01/1990");
    await tester.enterText(phoneField, "1234567890");
    await tester.enterText(dniField, "12345678");

    await tester.tap(saveWorkerButton);
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('lobbyPage')), findsOneWidget);
  });
}

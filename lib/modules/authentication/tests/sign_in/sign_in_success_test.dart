// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(List<String> args) {
  testWidgets('Inicio de sesión exitoso', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder emailField = find.byKey(const Key('emailField'));
    final Finder passwordField = find.byKey(const Key('passwordField'));
    final Finder signInButton = find.byKey(const Key('signInButton'));

    await tester.enterText(emailField, args[0]);
    await tester.enterText(passwordField, args[1]);

    await tester.tap(signInButton);
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('WorkerCreatePage')), findsOneWidget);
  });
}

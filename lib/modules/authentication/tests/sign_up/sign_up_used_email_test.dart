// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(List<String> args) {
  testWidgets('Intento de registrar con un email ya en uso', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder toSignUpButton = find.byKey(const Key('toSignUpButton'));
    await tester.tap(toSignUpButton);
    await tester.pumpAndSettle();

    final Finder emailField = find.byKey(const Key('emailField'));
    final Finder passwordField = find.byKey(const Key('passwordField'));
    final Finder confirmPasswordField = find.byKey(const Key('confirmPasswordField'));
    final Finder signUpButton = find.byKey(const Key('signUpButton'));

    await tester.enterText(emailField, args[0]);
    await tester.enterText(passwordField, args[1]);
    await tester.enterText(confirmPasswordField, args[1]);

    await tester.tap(signUpButton);
    await tester.pumpAndSettle();

    expect(find.text('El email ya está en uso por otra cuenta.'), findsOneWidget);

    await tester.tap(signUpButton);
    await tester.pumpAndSettle();

    expect(find.text('El email ya está en uso por otra cuenta.'), findsOneWidget);
  });
}

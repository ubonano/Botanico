// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Coincidencia de contraseña y confirmación', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder toSignUpButton = find.byKey(const Key('toSignUpButton'));
    await tester.tap(toSignUpButton);
    await tester.pumpAndSettle();

    final Finder passwordField = find.byKey(const Key('passwordField'));
    final Finder confirmPasswordField = find.byKey(const Key('confirmPasswordField'));
    final Finder signUpButton = find.byKey(const Key('signUpButton'));

    await tester.enterText(passwordField, 'password123');
    await tester.enterText(confirmPasswordField, 'password');

    await tester.tap(signUpButton);
    await tester.pumpAndSettle();

    expect(find.text('Las contraseñas no coinciden'), findsOneWidget);
  });
}

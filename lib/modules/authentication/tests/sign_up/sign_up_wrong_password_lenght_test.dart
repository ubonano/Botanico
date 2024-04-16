// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Validación de longitud de contraseña', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder toSignUpButton = find.byKey(const Key('toSignUpButton'));
    await tester.tap(toSignUpButton);
    await tester.pumpAndSettle();

    final Finder passwordField = find.byKey(const Key('passwordField'));
    final Finder signUpButton = find.byKey(const Key('signUpButton'));

    await tester.enterText(passwordField, '123');

    await tester.tap(signUpButton);
    await tester.pumpAndSettle();

    expect(find.text('La contraseña debe tener al menos 6 caracteres'), findsOneWidget);
  });
}

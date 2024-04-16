// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Contraseña inválida', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder passwordField = find.byKey(const Key('passwordField'));
    final Finder signInButton = find.byKey(const Key('signInButton'));

    await tester.enterText(passwordField, '123');

    await tester.tap(signInButton);
    await tester.pumpAndSettle();

    expect(find.text('La contraseña debe tener al menos 6 caracteres'), findsOneWidget);
  });
}

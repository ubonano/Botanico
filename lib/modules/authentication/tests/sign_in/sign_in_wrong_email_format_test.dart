// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Email inválido', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder emailField = find.byKey(const Key('emailField'));
    final Finder signInButton = find.byKey(const Key('signInButton'));

    await tester.enterText(emailField, 'invalid-email');

    await tester.tap(signInButton);
    await tester.pumpAndSettle();

    expect(find.text('Ingresa un email válido'), findsOneWidget);
  });
}

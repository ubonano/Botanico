// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(List<String> args) {
  testWidgets('Registro exitoso', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    await signUpUser(tester, args[0], args[1]);
  });
}

Future<void> signUpUser(WidgetTester tester, String email, String password) async {
  final Finder toSignUpButton = find.byKey(const Key('toSignUpButton'));
  await tester.tap(toSignUpButton);
  await tester.pumpAndSettle();

  final Finder emailField = find.byKey(const Key('emailField'));
  final Finder passwordField = find.byKey(const Key('passwordField'));
  final Finder confirmPasswordField = find.byKey(const Key('confirmPasswordField'));
  final Finder signUpButton = find.byKey(const Key('signUpButton'));

  await tester.enterText(emailField, email);
  await tester.enterText(passwordField, password);
  await tester.enterText(confirmPasswordField, password);

  await tester.tap(signUpButton);
  await tester.pumpAndSettle();

  expect(find.byKey(const Key('WorkerCreatePage')), findsOneWidget);
}

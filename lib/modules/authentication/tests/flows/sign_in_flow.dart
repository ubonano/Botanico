// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> signInFlow(WidgetTester tester, String email, String password) async {
  final Finder emailField = find.byKey(const Key('emailField'));
  final Finder passwordField = find.byKey(const Key('passwordField'));
  final Finder signInButton = find.byKey(const Key('signInButton'));

  await tester.enterText(emailField, email);
  await tester.enterText(passwordField, password);

  await tester.tap(signInButton);
  await tester.pumpAndSettle();
}

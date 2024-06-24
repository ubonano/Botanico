// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'sign_up_navigate_flow.dart';

Future<void> signUpFlow(WidgetTester tester, String email, String password, String confirmPassword) async {
  await signUpNavigateFlow(tester);

  final Finder emailField = find.byKey(const Key('emailField'));
  final Finder passwordField = find.byKey(const Key('passwordField'));
  final Finder confirmPasswordField = find.byKey(const Key('confirmPasswordField'));
  final Finder signUpButton = find.byKey(const Key('signUpButton'));

  await tester.enterText(emailField, email);
  await tester.enterText(passwordField, password);
  await tester.enterText(confirmPasswordField, confirmPassword);

  await tester.tap(signUpButton);
  await tester.pumpAndSettle();
}

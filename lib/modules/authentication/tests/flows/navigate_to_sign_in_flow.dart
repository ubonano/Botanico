// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> navigateToSignInFlow(WidgetTester tester) async {
  final Finder signUpButton = find.byKey(const Key('toSignInButton'));

  await tester.tap(signUpButton);
  await tester.pumpAndSettle();
}

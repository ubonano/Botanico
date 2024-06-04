// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> signInNavigateFlow(WidgetTester tester) async {
  final Finder signInNavigateButton = find.byKey(const Key('SignInNavigateButton'));

  await tester.tap(signInNavigateButton);
  await tester.pumpAndSettle();
}

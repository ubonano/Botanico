// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Aparrentemente esta fallando aca, no encuentra el boton

Future<void> navigateToSignUpFlow(WidgetTester tester) async {
  final Finder toSignUpButton = find.byKey(const Key('toSignUpButton'));

  await tester.tap(toSignUpButton);
  await tester.pumpAndSettle();
}

// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Aparrentemente esta fallando aca, no encuentra el boton

Future<void> signUpNavigateFlow(WidgetTester tester) async {
  final Finder signUpNavigateButton = find.byKey(const Key('SignUpNavigateButton'));

  await tester.tap(signUpNavigateButton);
  await tester.pumpAndSettle();
}

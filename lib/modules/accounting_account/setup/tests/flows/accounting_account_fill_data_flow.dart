// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> accountingAccountFillDataFlow(
  WidgetTester tester, {
  String name = 'Cuenta Contable S.A.',
  String observations = 'Ninguna',
}) async {
  final nameField = find.byKey(const Key('nameField'));
  final observationsField = find.byKey(const Key('observationsField'));

  await tester.enterText(nameField, name);
  await tester.enterText(observationsField, observations);
}


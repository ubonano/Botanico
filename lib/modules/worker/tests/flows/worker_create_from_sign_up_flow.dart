// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> workerCreateFlow(
  WidgetTester tester, {
  String name = 'John Doe',
  String birthdate = '01/01/1990',
  String phone = '1234567890',
  String dni = '12345678',
}) async {
  final Finder nameField = find.byKey(const Key('fullnameField'));
  final Finder birthdateField = find.byKey(const Key('birthdateField'));
  final Finder phoneField = find.byKey(const Key('phoneField'));
  final Finder dniField = find.byKey(const Key('dniField'));
  final Finder workerSaveButton = find.byKey(const Key('WorkerSaveButton'));

  await tester.enterText(nameField, name);
  await tester.enterText(birthdateField, birthdate);
  await tester.enterText(phoneField, phone);
  await tester.enterText(dniField, dni);

  await tester.tap(workerSaveButton);
  await tester.pumpAndSettle();
}

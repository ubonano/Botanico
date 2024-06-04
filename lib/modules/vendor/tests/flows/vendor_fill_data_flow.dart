// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> vendorFillDataFlow(
  WidgetTester tester, {
  String name = 'Empresa S.A.',
  String cuit = '30123456785',
  String registrationType = 'Responsable inscripto',
  String address = 'Calle Falsa 123',
  String phone = '1234567890',
  String observations = 'Ninguna',
}) async {
  final nameField = find.byKey(const Key('nameField'));
  final cuitField = find.byKey(const Key('cuitField'));
  final registrationTypeField = find.byKey(const Key('registrationTypeField'));
  final addressField = find.byKey(const Key('addressField'));
  final phoneField = find.byKey(const Key('phoneField'));
  final observationsField = find.byKey(const Key('observationsField'));

  await tester.enterText(nameField, name);
  await tester.enterText(cuitField, cuit);

  await tester.tap(registrationTypeField);
  await tester.pumpAndSettle();
  await tester.tap(find.text(registrationType).last);
  await tester.pumpAndSettle();

  await tester.enterText(addressField, address);
  await tester.enterText(phoneField, phone);
  await tester.enterText(observationsField, observations);
}

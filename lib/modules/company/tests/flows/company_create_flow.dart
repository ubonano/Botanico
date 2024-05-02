// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> companyCreateFlow(
  WidgetTester tester, {
  String name = 'Tech Solutions',
  String address = '123 Tech Street',
  String city = 'Tech City',
  String province = 'Tech Province',
  String country = 'Tech Country',
  String phone = '1234567890',
}) async {
  final nameField = find.byKey(const Key('nameField'));
  final addressField = find.byKey(const Key('addressField'));
  final cityField = find.byKey(const Key('cityField'));
  final provinceField = find.byKey(const Key('provinceField'));
  final countryField = find.byKey(const Key('countryField'));
  final phoneField = find.byKey(const Key('phoneField'));
  final companySaveButton = find.byKey(const Key('CompanySaveButton'));

  await tester.enterText(nameField, name);
  await tester.enterText(addressField, address);
  await tester.enterText(cityField, city);
  await tester.enterText(provinceField, province);
  await tester.enterText(countryField, country);
  await tester.enterText(phoneField, phone);

  await tester.tap(companySaveButton);
  await tester.pumpAndSettle();
}

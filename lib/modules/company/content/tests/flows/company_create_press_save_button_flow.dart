// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> companyCreatePressSaveButtonFlow(WidgetTester tester) async {
  final companySaveButton = find.byKey(const Key('CompanySaveButton'));

  await tester.tap(companySaveButton);
  await tester.pumpAndSettle();
}

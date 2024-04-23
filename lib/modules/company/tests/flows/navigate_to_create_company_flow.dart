// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> navigateToCreateCompanyFlow(WidgetTester tester) async {
  final toCreateCompany = find.byKey(const Key('ToCreateCompany'));

  await tester.tap(toCreateCompany);
  await tester.pumpAndSettle();
}

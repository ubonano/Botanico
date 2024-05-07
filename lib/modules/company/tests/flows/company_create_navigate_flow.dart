// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> companyCreateNavigateFlow(WidgetTester tester) async {
  final companyCreateNavigateButton = find.byKey(const Key('CompanyCreateNavigateButton'));

  await tester.tap(companyCreateNavigateButton);
  await tester.pumpAndSettle();
}

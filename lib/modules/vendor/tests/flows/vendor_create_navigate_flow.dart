// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> vendorCreateNavigateFlow(WidgetTester tester) async {
  await tester.tap(find.byKey(const Key('VendorCreateFAB')));
  await tester.pumpAndSettle();
}

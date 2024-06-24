// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> vendorListNavigateFlow(WidgetTester tester) async {
  await tester.tap(find.byKey(const Key('VendorListPageTileButton')));
  await tester.pumpAndSettle();
}

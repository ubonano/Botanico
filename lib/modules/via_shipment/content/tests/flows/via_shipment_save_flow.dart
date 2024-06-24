// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

Future<void> viaShipmentSaveFlow(WidgetTester tester) async {
  await tester.tap(find.byKey(const Key('ViaShipmentSaveButton')));
  await tester.pumpAndSettle();
}

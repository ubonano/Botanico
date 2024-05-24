import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> viaShipmentSaveFlow(WidgetTester tester) async {
  await tester.tap(find.byKey(const Key('ViaShipmentSaveButton')));
  await tester.pumpAndSettle();
}

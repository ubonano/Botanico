import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> viaShipmentCreateNavigateFlow(WidgetTester tester) async {
  await tester.tap(find.byKey(const Key('ViaShipmentCreateFAB')));
  await tester.pumpAndSettle();
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> viaShipmentListNavigateFlow(WidgetTester tester) async {
  await tester.tap(find.byKey(const Key('ViaShipmentListPageTileButton')));
  await tester.pumpAndSettle();
}


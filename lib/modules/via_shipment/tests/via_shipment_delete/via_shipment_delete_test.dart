// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/via_shipment/module.dart';

void viaShipmentDeleteTest(String email, String password) {
  testWidgets('Delete via shipment and verify', (WidgetTester tester) async {
    String shipmentId = 'Shipment to delete';

    await appInitFlow(tester);
    await companyCreateFromSignUpFlow(tester, email, password);
    await openDrawerFlow(tester);
    await viaShipmentListNavigateFlow(tester);
    await viaShipmentCreateNavigateFlow(tester);
    await viaShipmentFillDataFlow(tester, shipmentId: shipmentId);
    await viaShipmentSaveFlow(tester);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('ViaShipmentDeleteIconButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Confirmar'));
    await tester.pumpAndSettle();
    expect(find.text(shipmentId), findsNothing);
  });
}

// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/via_shipment/module.dart';

void viaShipmentUpdateAndVerifyDetailsTest(String email, String password) {
  testWidgets('Update via shipment details and verify', (WidgetTester tester) async {
    String shipmentId = '123';
    String description = 'Initial description';
    String newDescription = 'Updated description';

    await appInitFlow(tester);
    await companyCreateFromSignUpFlow(tester, email, password);
    await openDrawerFlow(tester);
    await viaShipmentListNavigateFlow(tester);
    await viaShipmentCreateNavigateFlow(tester);
    await viaShipmentFillDataFlow(tester, shipmentId: shipmentId, description: description);
    await viaShipmentSaveFlow(tester);
    await tester.pumpAndSettle();
    await tester.tap(find.text(shipmentId));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('ViaShipmentEnabledFormFields')));
    await tester.pumpAndSettle();
    await viaShipmentFillDataFlow(tester, description: newDescription);
    await viaShipmentSaveFlow(tester);
    await tester.pumpAndSettle();
    await tester.tap(find.text(shipmentId));
    await tester.pumpAndSettle();
    expect(find.text(newDescription), findsOneWidget);
  });
}

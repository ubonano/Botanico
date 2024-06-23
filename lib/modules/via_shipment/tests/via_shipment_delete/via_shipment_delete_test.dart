// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import '../../../app/tests/flows/app_init_flow.dart';
import '../../../company/tests/flows/company_create_from_sign_up_flow.dart';
import '../../../company/tests/flows/open_drawer_flow.dart';
import '../flows/via_shipment_create_navigate_flow.dart';
import '../flows/via_shipment_fill_data_flow.dart';
import '../flows/via_shipment_list_navigate_flow.dart';
import '../flows/via_shipment_save_flow.dart';

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

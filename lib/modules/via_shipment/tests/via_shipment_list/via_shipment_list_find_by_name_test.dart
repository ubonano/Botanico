// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/via_shipment/module.dart';

void viaShipmentListFindByNameTest(String email, String password) {
  testWidgets('Create via shipment and find by name', (WidgetTester tester) async {
    String shipmentId = '123';

    await appInitFlow(tester);
    await companyCreateFromSignUpFlow(tester, email, password);
    await openDrawerFlow(tester);
    await viaShipmentListNavigateFlow(tester);
    await viaShipmentCreateNavigateFlow(tester);
    await viaShipmentFillDataFlow(tester, shipmentId: shipmentId);
    await viaShipmentSaveFlow(tester);
    await tester.pumpAndSettle();
    expect(find.text(shipmentId), findsOneWidget);
  });
}

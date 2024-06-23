// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';

import '../../../app/tests/flows/app_init_flow.dart';
import '../../../company/tests/flows/company_create_from_sign_up_flow.dart';
import '../../../company/tests/flows/open_drawer_flow.dart';
import '../flows/via_shipment_create_navigate_flow.dart';
import '../flows/via_shipment_fill_data_flow.dart';
import '../flows/via_shipment_list_navigate_flow.dart';
import '../flows/via_shipment_save_flow.dart';

void viaShipmentListFindAndVerifyDetailsTest(String email, String password) {
  testWidgets('Create via shipment, find by name, and verify details', (WidgetTester tester) async {
    String shipmentId = '123';
    String description = 'Initial description';

    await appInitFlow(tester);
    await companyCreateFromSignUpFlow(tester, email, password);
    await openDrawerFlow(tester);
    await viaShipmentListNavigateFlow(tester);
    await viaShipmentCreateNavigateFlow(tester);
    await viaShipmentFillDataFlow(tester, shipmentId: shipmentId, description: description);
    await viaShipmentSaveFlow(tester);
    await tester.pumpAndSettle();
    expect(find.text(shipmentId), findsOneWidget);
    await tester.tap(find.text(shipmentId));
    await tester.pumpAndSettle();
    expect(find.text(description), findsOneWidget);
  });
}

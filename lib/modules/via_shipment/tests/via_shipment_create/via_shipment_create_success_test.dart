// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/company/module.dart';

import '../flows/via_shipment_create_navigate_flow.dart';
import '../flows/via_shipment_fill_data_flow.dart';
import '../flows/via_shipment_list_navigate_flow.dart';
import '../flows/via_shipment_save_flow.dart';

void viaShipmentCreateSuccessFromSignUpTest(String email, String password) {
  testWidgets('Create via shipment with valid data', (WidgetTester tester) async {
    await appInitFlow(tester);

    await companyCreateFromSignUpFlow(tester, email, password);

    await openDrawerFlow(tester);

    await viaShipmentListNavigateFlow(tester);

    await viaShipmentCreateNavigateFlow(tester);

    await viaShipmentFillDataFlow(tester);

    await viaShipmentSaveFlow(tester);

    expect(find.text('Via Shipments'), findsOneWidget);
  });
}

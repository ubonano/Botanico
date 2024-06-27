// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';

import '../../../../app/content/tests/flows/app_init_flow.dart';
import '../../../../company/content/tests/flows/company_create_from_sign_up_flow.dart';
import '../../../../company/content/tests/flows/open_drawer_flow.dart';
import '../flows/shipment_create_navigate_flow.dart';
import '../flows/shipment_fill_data_flow.dart';
import '../flows/shipment_list_navigate_flow.dart';
import '../flows/shipment_save_flow.dart';

void shipmentListFindAndVerifyDetailsTest(String email, String password) {
  testWidgets('Create shipment, find by name, and verify details', (WidgetTester tester) async {
    String shipmentId = '123';
    String description = 'Initial description';

    await appInitFlow(tester);
    await companyCreateFromSignUpFlow(tester, email, password);
    await openDrawerFlow(tester);
    await shipmentListNavigateFlow(tester);
    await shipmentCreateNavigateFlow(tester);
    await shipmentFillDataFlow(tester, shipmentId: shipmentId, description: description);
    await shipmentSaveFlow(tester);
    await tester.pumpAndSettle();
    expect(find.text(shipmentId), findsOneWidget);
    await tester.tap(find.text(shipmentId));
    await tester.pumpAndSettle();
    expect(find.text(description), findsOneWidget);
  });
}

// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';

import '../../../../app/content/tests/flows/app_init_flow.dart';
import '../../../../company/content/tests/flows/company_create_from_sign_up_flow.dart';
import '../../../../company/content/tests/flows/open_drawer_flow.dart';
import '../flows/shipment_create_navigate_flow.dart';
import '../flows/shipment_fill_data_flow.dart';
import '../flows/shipment_list_navigate_flow.dart';
import '../flows/shipment_save_flow.dart';

void shipmentCreateSuccessFromSignUpTest(String email, String password) {
  testWidgets('Create shipment with valid data', (WidgetTester tester) async {
    await appInitFlow(tester);

    await companyCreateFromSignUpFlow(tester, email, password);

    await openDrawerFlow(tester);

    await shipmentListNavigateFlow(tester);

    await shipmentCreateNavigateFlow(tester);

    await shipmentFillDataFlow(tester);

    await shipmentSaveFlow(tester);

    expect(find.text('Envíos'), findsOneWidget);
  });
}

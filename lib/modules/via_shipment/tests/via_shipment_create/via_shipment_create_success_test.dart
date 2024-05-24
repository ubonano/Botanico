import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/via_shipment/module.dart';

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

import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/via_shipment/module.dart';

void viaShipmentListFindAndVerifyDetailsTest(String email, String password) {
  testWidgets('Create via shipment, find by name, and verify details', (WidgetTester tester) async {
    String shipmentId = 'Shipment123';
    String description = 'Initial description';

    await appInitFlow(tester);
    await companyCreateFromSignUpFlow(tester, email, password);
    await openDrawerFlow(tester);
    await viaShipmentListNavigateFlow(tester);

    await viaShipmentCreateNavigateFlow(tester);
    await viaShipmentFillDataFlow(
      tester,
      shipmentId: shipmentId,
      description: description,
    );
    await viaShipmentSaveFlow(tester);

    await tester.pumpAndSettle();

    expect(find.text(shipmentId), findsOneWidget);
    await tester.tap(find.text(shipmentId));
    await tester.pumpAndSettle();

    expect(find.text(description), findsOneWidget);
  });
}

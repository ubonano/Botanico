// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/vendor/module.dart';

void vendorListFindByNameTest(String email, String password) {
  testWidgets('Create vendor and find by name', (WidgetTester tester) async {
    String vendorName = 'Proveedor de prueba';

    await appInitFlow(tester);
    await companyCreateFromSignUpFlow(tester, email, password);
    await openDrawerFlow(tester);
    await vendorListNavigateFlow(tester);

    await vendorCreateNavigateFlow(tester);
    await vendorFillDataFlow(tester, name: vendorName);
    await vendorSaveFlow(tester);

    await tester.pumpAndSettle();

    expect(find.text(vendorName), findsOneWidget);
  });
}

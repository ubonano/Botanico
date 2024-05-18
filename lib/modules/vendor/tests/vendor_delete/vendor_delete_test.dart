// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/vendor/module.dart';

void vendorDeleteTest(String email, String password) {
  testWidgets('Delete vendor and verify', (WidgetTester tester) async {
    String vendorName = 'Proveedor a eliminar';

    await appInitFlow(tester);
    await companyCreateFromSignUpFlow(tester, email, password);
    await openDrawerFlow(tester);
    await vendorListNavigateFlow(tester);
    await vendorCreateNavigateFlow(tester);
    await vendorFillDataFlow(tester, name: vendorName);
    await vendorSaveFlow(tester);
    await tester.pumpAndSettle();

    // await tester.tap(find.text(vendorName));
    // await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('VendorDeleteIconButton')));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Confirmar'));
    await tester.pumpAndSettle();

    expect(find.text(vendorName), findsNothing);
  });
}

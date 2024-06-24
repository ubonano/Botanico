// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../app/content/tests/flows/app_init_flow.dart';
import '../../../../company/content/tests/flows/company_create_from_sign_up_flow.dart';
import '../../../../company/content/tests/flows/open_drawer_flow.dart';
import '../flows/vendor_create_navigate_flow.dart';
import '../flows/vendor_fill_data_flow.dart';
import '../flows/vendor_list_navigate_flow.dart';
import '../flows/vendor_save_flow.dart';

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

    await tester.tap(find.byKey(const Key('VendorDeleteIconButton')));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Confirmar'));
    await tester.pumpAndSettle();

    expect(find.text(vendorName), findsNothing);
  });
}

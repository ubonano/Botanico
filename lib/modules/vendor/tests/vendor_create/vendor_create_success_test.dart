// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/company/module.dart';

import '../flows/vendor_create_navigate_flow.dart';
import '../flows/vendor_fill_data_flow.dart';
import '../flows/vendor_list_navigate_flow.dart';
import '../flows/vendor_save_flow.dart';

void vendorCreateSuccessFromSignUpTest(String email, String password) {
  testWidgets('Create vendor success from sign up', (WidgetTester tester) async {
    await appInitFlow(tester);
    await companyCreateFromSignUpFlow(tester, email, password);
    await openDrawerFlow(tester);
    await vendorListNavigateFlow(tester);

    await vendorCreateNavigateFlow(tester);
    await vendorFillDataFlow(tester);
    await vendorSaveFlow(tester);

    expect(find.byKey(const Key('VendorListPage')), findsOneWidget);
  });
}

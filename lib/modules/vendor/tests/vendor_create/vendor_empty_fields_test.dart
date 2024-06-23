// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/company/module.dart';

import '../flows/vendor_create_navigate_flow.dart';
import '../flows/vendor_list_navigate_flow.dart';
import '../flows/vendor_save_flow.dart';

void vendorCreateEmptyFieldsFromSignUpTest(String email, String password) {
  testWidgets('Create vendor with empty fields', (WidgetTester tester) async {
    await appInitFlow(tester);

    await companyCreateFromSignUpFlow(tester, email, password);

    await openDrawerFlow(tester);
    await vendorListNavigateFlow(tester);

    await vendorCreateNavigateFlow(tester);
    await vendorSaveFlow(tester);

    expect(find.text('Este campo es obligatorio'), findsNWidgets(5));
  });
}

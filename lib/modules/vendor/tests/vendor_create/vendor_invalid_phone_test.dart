// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/vendor/module.dart';

void vendorCreateInvalidPhoneTest(String email, String password) {
  testWidgets('Create vendor with invalid phone format', (WidgetTester tester) async {
    await appInitFlow(tester);
    await companyCreateFromSignUpFlow(tester, email, password);
    await openDrawerFlow(tester);
    await vendorListNavigateFlow(tester);

    await vendorCreateNavigateFlow(tester);
    await vendorFillDataFlow(tester, phone: 'abc123');
    await vendorSaveFlow(tester);

    expect(find.text('Este campo debe ser numérico'), findsOneWidget);
  });
}

// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/accounting_account/module.dart';

void accountingAccountCreateSuccessFromSignUpTest(String email, String password) {
  testWidgets('Create accounting account with valid data', (WidgetTester tester) async {
    await appInitFlow(tester);

    await companyCreateFromSignUpFlow(tester, email, password);

    await openDrawerFlow(tester);
    await accountingAccountListNavigateFlow(tester);

    await accountingAccountCreateNavigateFlow(tester);
    await accountingAccountFillDataFlow(tester);
    await accountingAccountSaveFlow(tester);

    expect(find.text('Cuentas Contables'), findsOneWidget);
  });
}

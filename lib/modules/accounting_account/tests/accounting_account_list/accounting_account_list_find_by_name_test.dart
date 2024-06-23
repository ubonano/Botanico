// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/company/module.dart';

import '../flows/accounting_account_create_navigate_flow.dart';
import '../flows/accounting_account_fill_data_flow.dart';
import '../flows/accounting_account_list_navigate_flow.dart';
import '../flows/accounting_account_save_flow.dart';

void accountingAccountListFindByNameTest(String email, String password) {
  testWidgets('Create accounting account and find by name', (WidgetTester tester) async {
    String accountingAccountName = 'Cuenta Contable de prueba';

    await appInitFlow(tester);
    await companyCreateFromSignUpFlow(tester, email, password);
    await openDrawerFlow(tester);
    await accountingAccountListNavigateFlow(tester);

    await accountingAccountCreateNavigateFlow(tester);
    await accountingAccountFillDataFlow(tester, name: accountingAccountName);
    await accountingAccountSaveFlow(tester);

    await tester.pumpAndSettle();

    expect(find.text(accountingAccountName), findsOneWidget);
  });
}

// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../app/tests/flows/app_init_flow.dart';
import '../../../company/tests/flows/company_create_from_sign_up_flow.dart';
import '../../../company/tests/flows/open_drawer_flow.dart';
import '../flows/accounting_account_create_navigate_flow.dart';
import '../flows/accounting_account_fill_data_flow.dart';
import '../flows/accounting_account_list_navigate_flow.dart';
import '../flows/accounting_account_save_flow.dart';

void accountingAccountDeleteTest(String email, String password) {
  testWidgets('Delete accounting account and verify', (WidgetTester tester) async {
    String accountingAccountName = 'Cuenta Contable a eliminar';

    await appInitFlow(tester);
    await companyCreateFromSignUpFlow(tester, email, password);
    await openDrawerFlow(tester);
    await accountingAccountListNavigateFlow(tester);
    await accountingAccountCreateNavigateFlow(tester);
    await accountingAccountFillDataFlow(tester, name: accountingAccountName);
    await accountingAccountSaveFlow(tester);
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('AccountingAccountDeleteIconButton')));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Confirmar'));
    await tester.pumpAndSettle();

    expect(find.text(accountingAccountName), findsNothing);
  });
}

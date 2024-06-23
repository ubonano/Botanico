// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/company/module.dart';

import '../flows/accounting_account_create_navigate_flow.dart';
import '../flows/accounting_account_fill_data_flow.dart';
import '../flows/accounting_account_list_navigate_flow.dart';
import '../flows/accounting_account_save_flow.dart';

void accountingAccountUpdateAndVerifyDetailsTest(String email, String password) {
  testWidgets('Update accounting account details and verify', (WidgetTester tester) async {
    String accountingAccountName = 'Cuenta Contable de prueba';
    String observations = 'Observaciones de prueba';

    String newAccountingAccountName = 'Nueva cuenta contable';
    String newObservations = 'Nuevas observaciones';

    await appInitFlow(tester);
    await companyCreateFromSignUpFlow(tester, email, password);
    await openDrawerFlow(tester);
    await accountingAccountListNavigateFlow(tester);

    await accountingAccountCreateNavigateFlow(tester);
    await accountingAccountFillDataFlow(tester, name: accountingAccountName, observations: observations);
    await accountingAccountSaveFlow(tester);

    await tester.pumpAndSettle();
    await tester.tap(find.text(accountingAccountName));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('AccountingAccountEnabledFormFields')));
    await tester.pumpAndSettle();

    await accountingAccountFillDataFlow(tester, name: newAccountingAccountName, observations: newObservations);
    await accountingAccountSaveFlow(tester);

    await tester.pumpAndSettle();

    expect(find.text(newAccountingAccountName), findsOneWidget);
    await tester.tap(find.text(newAccountingAccountName));
    await tester.pumpAndSettle();

    expect(find.text(newObservations), findsOneWidget);
  });
}

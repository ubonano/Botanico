// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/accounting_account/module.dart';

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

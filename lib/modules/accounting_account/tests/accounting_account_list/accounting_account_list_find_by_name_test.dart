// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/accounting_account/module.dart';

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


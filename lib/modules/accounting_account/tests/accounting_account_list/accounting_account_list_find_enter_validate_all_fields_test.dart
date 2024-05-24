// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/accounting_account/module.dart';

void accountingAccountListFindAndVerifyDetailsTest(String email, String password) {
  testWidgets('Create accounting account, find by name, and verify details', (WidgetTester tester) async {
    String accountingAccountName = 'Cuenta Contable de prueba';
    String observations = 'Observaciones de prueba';

    await appInitFlow(tester);
    await companyCreateFromSignUpFlow(tester, email, password);
    await openDrawerFlow(tester);
    await accountingAccountListNavigateFlow(tester);

    await accountingAccountCreateNavigateFlow(tester);
    await accountingAccountFillDataFlow(
      tester,
      name: accountingAccountName,
      observations: observations,
    );
    await accountingAccountSaveFlow(tester);

    await tester.pumpAndSettle();

    expect(find.text(accountingAccountName), findsOneWidget);
    await tester.tap(find.text(accountingAccountName));
    await tester.pumpAndSettle();

    expect(find.text(observations), findsOneWidget);
  });
}

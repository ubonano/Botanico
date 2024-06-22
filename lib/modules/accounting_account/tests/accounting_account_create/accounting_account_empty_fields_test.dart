// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/accounting_account/module.dart';

void accountingAccountCreateEmptyFieldsFromSignUpTest(String email, String password) {
  testWidgets('Create accounting account with empty fields', (WidgetTester tester) async {
    await appInitFlow(tester);

    await companyCreateFromSignUpFlow(tester, email, password);

    await openDrawerFlow(tester);
    await accountingAccountListNavigateFlow(tester);

    await accountingAccountCreateNavigateFlow(tester);
    await accountingAccountSaveFlow(tester);

    expect(find.text('Este campo es obligatorio'), findsNWidgets(1));
  });
}

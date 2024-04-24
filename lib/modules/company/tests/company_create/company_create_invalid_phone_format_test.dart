// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';

import 'package:flutter_test/flutter_test.dart';

void createCompanyWithInvalidPhoneTest(String email, String password) {
  testWidgets('Create company with invalid phone from sign up', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, email, password, password);
    await workerCreateFlow(tester);
    await navigateToCreateCompanyFlow(tester);
    await createCompanyFlow(tester, phone: 'abc123');
    expect(find.text('Este campo debe ser numérico'), findsOneWidget);
  });
}

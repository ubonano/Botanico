// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:flutter_test/flutter_test.dart';

void createCompanyWithEmptyFieldsTest(String email, String password) {
  testWidgets('Create company with empty fields from sign up', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, email, password, password);
    await workerCreateFlow(tester);
    await navigateToCreateCompanyFlow(tester);
    await createCompanyFlow(tester, name: '', address: '', city: '', country: '', province: '', phone: '');
    expect(find.text('Este campo es obligatorio'), findsNWidgets(6));
  });
}

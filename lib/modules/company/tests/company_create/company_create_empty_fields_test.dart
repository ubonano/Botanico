// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';

import 'package:botanico/modules/worker/module.dart';

import '../../../authentication/tests/flows/sign_up_flow.dart';
import '../../module.dart';

void companyCreateEmptyFieldsTest(String email, String password) {
  testWidgets('Create company with empty fields from sign up', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, email, password, password);
    await workerCreateFlow(tester);
    await companyCreateNavigateFlow(tester);
    await companyCreateFillDataFlow(tester, name: '', address: '', city: '', country: '', province: '', phone: '');
    await companyCreatePressSaveButtonFlow(tester);
    expect(find.text('Este campo es obligatorio'), findsNWidgets(6));
  });
}

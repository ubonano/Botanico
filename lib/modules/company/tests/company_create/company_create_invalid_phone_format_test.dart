// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/worker/module.dart';

import '../../module.dart';

void companyCreateInvalidPhoneTest(String email, String password) {
  testWidgets('Create company with invalid phone from sign up', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, email, password, password);
    await workerCreateFlow(tester);
    await companyCreateNavigateFlow(tester);
    await companyCreateFillDataFlow(tester, phone: 'abc123');
    await companyCreatePressSaveButtonFlow(tester);
    expect(find.text('Este campo debe ser numérico'), findsOneWidget);
  });
}

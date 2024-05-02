// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void companyCreateSuccessFromSignUpTest(String email, String password) {
  testWidgets('Create company success from sign up', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, email, password, password);
    await workerCreateFlow(tester);
    await companyCreateNavigateFlow(tester);
    await companyCreateFlow(tester);
    expect(find.byKey(const Key('HomePage')), findsOneWidget);
  });
}

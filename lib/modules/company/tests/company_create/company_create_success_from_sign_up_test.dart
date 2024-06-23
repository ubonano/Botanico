// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import '../../../app/tests/flows/app_init_flow.dart';
import '../../../authentication/lib/tests/flows/sign_up_flow.dart';
import '../../../worker/tests/flows/worker_create_from_sign_up_flow.dart';
import '../flows/company_create_fill_data_flow.dart';
import '../flows/company_create_navigate_flow.dart';
import '../flows/company_create_press_save_button_flow.dart';

void companyCreateSuccessFromSignUpTest(String email, String password) {
  testWidgets('Create company success from sign up', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, email, password, password);
    await workerCreateFlow(tester);
    await companyCreateNavigateFlow(tester);
    await companyCreateFillDataFlow(tester);
    await companyCreatePressSaveButtonFlow(tester);
    expect(find.byKey(const Key('HomePage')), findsOneWidget);
  });
}

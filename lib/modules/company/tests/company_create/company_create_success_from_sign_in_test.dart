// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/company/tests/flows/company_create_fill_data_flow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../app/tests/flows/app_init_flow.dart';
import '../../../authentication/tests/flows/sign_in_flow.dart';
import '../../../authentication/tests/flows/sign_out_flow.dart';
import '../../../authentication/tests/flows/sign_up_flow.dart';
import '../../../worker/tests/flows/worker_create_from_sign_up_flow.dart';
import '../flows/company_create_navigate_flow.dart';
import '../flows/company_create_press_save_button_flow.dart';

void companyCreateSuccessFromSignInTest(String email, String password) {
  testWidgets('Create company success from sign in', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, email, password, password);
    await signOutFromWorkerCreateFlow(tester);
    await signInFlow(tester, email, password);
    await workerCreateFlow(tester);
    await companyCreateNavigateFlow(tester);
    await companyCreateFillDataFlow(tester);
    await companyCreatePressSaveButtonFlow(tester);
    expect(find.byKey(const Key('HomePage')), findsOneWidget);
  });
}

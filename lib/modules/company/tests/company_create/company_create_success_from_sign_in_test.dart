// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/worker/module.dart';

import '../../module.dart';

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

// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../app/tests/flows/app_init_flow.dart';
import '../../flows/sign_in_flow.dart';
import '../../flows/sign_out_flow.dart';

void signOutFromWorkerCreatePageTest(String email, String password) {
  testWidgets('Sign out from worker create page', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signInFlow(tester, email, password);
    expect(find.byKey(const Key('WorkerFormPage')), findsOneWidget);
    await signOutFromWorkerCreateFlow(tester);
    expect(find.byKey(const Key('SignInPage')), findsOneWidget);
  });
}

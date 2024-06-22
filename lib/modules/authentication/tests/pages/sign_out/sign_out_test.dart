// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/company/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../module.dart';

void signOutFromWorkerCreatePageTest(String email, String password) {
  testWidgets('Sign out from worker create page', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signInFlow(tester, email, password);
    expect(find.byKey(const Key('WorkerFormPage')), findsOneWidget);
    await signOutFromWorkerCreateFlow(tester);
    expect(find.byKey(const Key('SignInPage')), findsOneWidget);
  });
}

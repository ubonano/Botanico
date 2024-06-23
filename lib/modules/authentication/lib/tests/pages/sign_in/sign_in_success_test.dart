// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../app/tests/flows/app_init_flow.dart';
import '../../flows/sign_in_flow.dart';

void signInSuccessByNewUserTest(String email, String password) {
  testWidgets('Sign in success by new user', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signInFlow(tester, email, password);
    expect(find.byKey(const Key('WorkerFormPage')), findsOneWidget);
  });
}

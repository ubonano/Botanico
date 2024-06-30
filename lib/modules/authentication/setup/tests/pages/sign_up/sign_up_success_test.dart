// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../app/content/tests/flows/app_init_flow.dart';
import '../../flows/sign_up_flow.dart';

void signUpSuccessTest(String email, String password) {
  testWidgets('Sign up success', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, email, password, password);
    expect(find.byKey(const Key('WorkerFormPage')), findsOneWidget);
  });
}

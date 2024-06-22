// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/company/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../module.dart';

void signInSuccessByNewUserTest(String email, String password) {
  testWidgets('Sign in success by new user', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signInFlow(tester, email, password);
    expect(find.byKey(const Key('WorkerFormPage')), findsOneWidget);
  });
}

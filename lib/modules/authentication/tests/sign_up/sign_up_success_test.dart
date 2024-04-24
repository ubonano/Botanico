// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void signUpSuccessTest(String email, String password) {
  testWidgets('Sign up success', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, email, password, password);
    expect(find.byKey(const Key('WorkerCreatePage')), findsOneWidget);
  });
}

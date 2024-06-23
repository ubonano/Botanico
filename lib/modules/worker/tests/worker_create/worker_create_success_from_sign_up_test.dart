// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../app/tests/flows/app_init_flow.dart';
import '../../../authentication/lib/tests/flows/sign_up_flow.dart';
import '../flows/worker_create_from_sign_up_flow.dart';

void createWorkerSuccessFromSignUpTest(String email, String password) {
  testWidgets('Create worker success from sign up', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, email, password, password);
    await workerCreateFlow(tester);
    expect(find.byKey(const Key('lobbyPage')), findsOneWidget);
  });
}

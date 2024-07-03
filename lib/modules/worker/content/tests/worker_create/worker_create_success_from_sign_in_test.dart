// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import '../../../../app/content/tests/flows/app_init_flow.dart';
import '../../../../authentication/setup/tests/flows/sign_in_flow.dart';
import '../../../../authentication/setup/tests/flows/sign_out_flow.dart';
import '../../../../authentication/setup/tests/flows/sign_up_flow.dart';
import '../flows/worker_create_from_sign_up_flow.dart';

void createWorkerSuccessFromSignInTest(String email, String password) {
  testWidgets('Create worker success from sign up', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, email, password, password);
    await signOutFromWorkerCreateFlow(tester);
    await signInFlow(tester, email, password);
    await workerCreateFlow(tester);
    expect(find.byKey(const Key('lobbyPage')), findsOneWidget);
  });
}

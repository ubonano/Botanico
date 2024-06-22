// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/authentication/module.dart';

import '../../module.dart';

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

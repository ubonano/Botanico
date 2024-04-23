// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(List<String> args) {
  testWidgets('Sign out from worker create page', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signInFlow(tester, args[0], args[1]);
    expect(find.byKey(const Key('WorkerCreatePage')), findsOneWidget);
    await signOutFromWorkerCreateFlow(tester);
    expect(find.byKey(const Key('SignInPage')), findsOneWidget);
  });
}

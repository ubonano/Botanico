// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../module.dart';

void main(List<String> args) {
  testWidgets('Sign in success by new user', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signInFlow(tester, args[0], args[1]);
    expect(find.byKey(const Key('WorkerCreatePage')), findsOneWidget);
  });
}

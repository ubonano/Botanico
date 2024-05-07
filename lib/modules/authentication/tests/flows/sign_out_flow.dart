// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> signOutFromWorkerCreateFlow(WidgetTester tester) async {
  final Finder signOutButton = find.byKey(const Key('signOutButton'));
  await tester.tap(signOutButton);
  await tester.pumpAndSettle();
}

// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/foundation/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../authentication_module.dart';

void signInNavigateToSignUpTest() => main();

void main() {
  testWidgets('Navigate to sign up from sign in', (WidgetTester tester) async {
    await appInitFlow(tester);

    await navigateToSignUpFlow(tester);
    expect(find.byKey(const Key('SignUpPage')), findsOneWidget);
  });
}

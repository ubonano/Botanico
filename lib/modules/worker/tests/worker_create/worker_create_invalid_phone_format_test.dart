// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/authentication/module.dart';

import '../../module.dart';

void createWorkerInvalidPhoneTest(String email, String password) {
  testWidgets('Create worker with invalid phone', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, email, password, password);
    await workerCreateFlow(tester, phone: 'numero');
    expect(find.text('Este campo debe ser numérico'), findsOneWidget);
  });
}

// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:flutter_test/flutter_test.dart';

void createWorkerWithInvalidPhoneTest(String email, String password) {
  testWidgets('Create worker with invalid phone', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, email, password, password);
    await workerCreateFlow(tester, phone: 'numero');
    expect(find.text('Este campo debe ser numérico'), findsOneWidget);
  });
}

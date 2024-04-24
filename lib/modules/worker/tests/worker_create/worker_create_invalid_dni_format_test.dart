// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:flutter_test/flutter_test.dart';

void createWorkerWithInvalidDNITest(String email, String password) {
  testWidgets('Create worker with invalid dni', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, email, password, password);
    await workerCreateFlow(tester, dni: 'ABC1234');
    expect(find.text('Este campo debe ser numérico'), findsOneWidget);
  });
}

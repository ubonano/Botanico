// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:flutter_test/flutter_test.dart';

void createWorkerWithInvalidPhoneTest(String email, String password) => main([email, password]);

void main(List<String> args) {
  testWidgets('Create worker with invalid phone', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, args[0], args[1], args[1]);
    await workerCreateFlow(tester, phone: 'numero');
    expect(find.text('Este campo debe ser numérico'), findsOneWidget);
  });
}

// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:flutter_test/flutter_test.dart';

void createWorkerWithEmptyFieldsTest(String email, String password) {
  testWidgets('Create worker with empty fields', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, email, password, password);
    await workerCreateFlow(tester, name: '', birthdate: '', phone: '', dni: '');
    expect(find.text('Este campo es obligatorio'), findsNWidgets(4));
  });
}

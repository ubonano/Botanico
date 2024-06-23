// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/company/module.dart';

import '../../../authentication/tests/flows/sign_up_flow.dart';
import '../flows/worker_create_from_sign_up_flow.dart';

void createWorkerEmptyFieldsTest(String email, String password) {
  testWidgets('Create worker with empty fields', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, email, password, password);
    await workerCreateFlow(tester, name: '', birthdate: '', phone: '', dni: '');
    expect(find.text('Este campo es obligatorio'), findsNWidgets(4));
  });
}

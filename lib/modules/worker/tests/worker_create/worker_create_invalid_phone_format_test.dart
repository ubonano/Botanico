// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';

import '../../../app/tests/flows/app_init_flow.dart';
import '../../../authentication/lib/tests/flows/sign_up_flow.dart';
import '../flows/worker_create_from_sign_up_flow.dart';

void createWorkerInvalidPhoneTest(String email, String password) {
  testWidgets('Create worker with invalid phone', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, email, password, password);
    await workerCreateFlow(tester, phone: 'numero');
    expect(find.text('Este campo debe ser numérico'), findsOneWidget);
  });
}

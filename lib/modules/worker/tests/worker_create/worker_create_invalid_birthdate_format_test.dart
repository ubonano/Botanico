// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';

import '../../../../tests/flows/app_init_flow.dart';
import '../../../authentication/tests/flows/sign_up_flow.dart';
import '../flows/worker_create_from_sign_up_flow.dart';

void createWorkerInvalidBirthdateTest(String email, String password) {
  testWidgets('Create worker with invalid birthdate', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, email, password, password);
    await workerCreateFlow(tester, birthdate: '19900101');
    expect(find.text('Este campo debe tener el formato DD/MM/AAAA'), findsOneWidget);
  });
}

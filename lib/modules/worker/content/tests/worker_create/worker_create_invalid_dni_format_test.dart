// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';

import '../../../../app/content/tests/flows/app_init_flow.dart';
import '../../../../authentication/setup/tests/flows/sign_up_flow.dart';
import '../flows/worker_create_from_sign_up_flow.dart';

void createWorkerInvalidDNITest(String email, String password) {
  testWidgets('Create worker with invalid dni', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, email, password, password);
    await workerCreateFlow(tester, dni: 'ABC1234');
    expect(find.text('Este campo debe ser numérico'), findsOneWidget);
  });
}

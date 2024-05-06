// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:flutter_test/flutter_test.dart';

void createWorkerWithInvalidBirthdateTest(String email, String password) {
  testWidgets('Create worker with invalid birthdate', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, email, password, password);
    await workerCreateFlow(tester, birthdate: '19900101');
    expect(find.text('Este campo debe tener el formato DD/MM/AAAA'), findsOneWidget);
  });
}

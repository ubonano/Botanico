// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/authentication/module.dart';

import '../../module.dart';

void createWorkerInvalidDNITest(String email, String password) {
  testWidgets('Create worker with invalid dni', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, email, password, password);
    await workerCreateFlow(tester, dni: 'ABC1234');
    expect(find.text('Este campo debe ser numérico'), findsOneWidget);
  });
}

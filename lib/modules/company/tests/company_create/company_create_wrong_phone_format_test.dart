// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/main.dart' as app;
import 'package:botanico/modules/worker/tests/worker_create/worker_create_success_test.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main(List<String> args) {
  testWidgets('Crear empresa - Validación de formato de teléfono', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    await signUpAndCreateWorker(tester, args[0], args[1]);
    await tester.pumpAndSettle();

    final toCreateCompany = find.byKey(const Key('ToCreateCompany'));

    await tester.tap(toCreateCompany);
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('CompanyCreatePage')), findsOneWidget);

    final phoneField = find.byKey(const Key('phoneField'));
    final saveCompanyButton = find.byKey(const Key('saveCompanyButton'));

    await tester.enterText(phoneField, 'abc123');

    await tester.tap(saveCompanyButton);
    await tester.pumpAndSettle();

    expect(find.text('Este campo debe ser numérico'), findsOneWidget);
  });
}

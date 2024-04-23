// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/main.dart' as app;
import 'package:botanico/modules/worker/tests/worker_create/worker_create_success_from_sign_up_test.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main(List<String> args) {
  testWidgets('Crear empresa - Creación exitosa de la empresa', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    await signUpAndCreateWorker(tester, args[0], args[1]);
    await tester.pumpAndSettle();

    final toCreateCompany = find.byKey(const Key('ToCreateCompany'));

    await tester.tap(toCreateCompany);
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('CompanyCreatePage')), findsOneWidget);

    final nameField = find.byKey(const Key('nameField'));
    final addressField = find.byKey(const Key('addressField'));
    final cityField = find.byKey(const Key('cityField'));
    final provinceField = find.byKey(const Key('provinceField'));
    final countryField = find.byKey(const Key('countryField'));
    final phoneField = find.byKey(const Key('phoneField'));
    final saveCompanyButton = find.byKey(const Key('saveCompanyButton'));

    await tester.enterText(nameField, 'Tech Solutions');
    await tester.enterText(addressField, '123 Tech Street');
    await tester.enterText(cityField, 'Tech City');
    await tester.enterText(provinceField, 'Tech Province');
    await tester.enterText(countryField, 'Tech Country');
    await tester.enterText(phoneField, '1234567890');

    await tester.tap(saveCompanyButton);
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('HomePage')), findsOneWidget);
  });
}

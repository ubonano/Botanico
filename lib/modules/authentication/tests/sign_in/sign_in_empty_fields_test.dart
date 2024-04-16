// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Campos vacíos', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    final Finder signInButton = find.byKey(const Key('signInButton'));

    await tester.tap(signInButton);
    await tester.pumpAndSettle();

    expect(find.text('Este campo es obligatorio'), findsWidgets);
  });
}

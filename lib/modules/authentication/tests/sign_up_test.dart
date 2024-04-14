// ignore_for_file: depend_on_referenced_packages

import 'dart:math';

import 'package:botanico/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

/* 

Tu run execute:
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=lib/modules/authentication/tests/sign_up_test.dart \
  -d chrome
  
*/

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final email = '${generateRandomString(5)}@test.com';
  // const email = 'user@test.com';
  const password = 'password123';

  group('Pruebas de registro', () {
    testWidgets('Navegación a Iniciar Sesión', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final Finder toSignUpButton = find.byKey(const Key('toSignUpButton'));
      await tester.tap(toSignUpButton);
      await tester.pumpAndSettle();

      final Finder signUpButton = find.byKey(const Key('toSignInButton'));

      await tester.tap(signUpButton);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('SignInPage')), findsOneWidget);
    });

    testWidgets('Validación de campos vacíos', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final Finder toSignUpButton = find.byKey(const Key('toSignUpButton'));
      await tester.tap(toSignUpButton);
      await tester.pumpAndSettle();

      final Finder signUpButton = find.byKey(const Key('signUpButton'));

      await tester.tap(signUpButton);
      await tester.pumpAndSettle();

      expect(find.text('Este campo es obligatorio'), findsNWidgets(3));
    });

    testWidgets('Validación de formato de email', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final Finder toSignUpButton = find.byKey(const Key('toSignUpButton'));
      await tester.tap(toSignUpButton);
      await tester.pumpAndSettle();

      final Finder emailField = find.byKey(const Key('emailField'));
      final Finder signUpButton = find.byKey(const Key('signUpButton'));

      await tester.enterText(emailField, 'invalid-email');

      await tester.tap(signUpButton);
      await tester.pumpAndSettle();

      expect(find.text('Ingresa un email válido'), findsOneWidget);
    });

    testWidgets('Validación de longitud de contraseña', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final Finder toSignUpButton = find.byKey(const Key('toSignUpButton'));
      await tester.tap(toSignUpButton);
      await tester.pumpAndSettle();

      final Finder passwordField = find.byKey(const Key('passwordField'));
      final Finder signUpButton = find.byKey(const Key('signUpButton'));

      await tester.enterText(passwordField, '123');

      await tester.tap(signUpButton);
      await tester.pumpAndSettle();

      expect(find.text('La contraseña debe tener al menos 6 caracteres'), findsOneWidget);
    });

    testWidgets('Coincidencia de contraseña y confirmación', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final Finder toSignUpButton = find.byKey(const Key('toSignUpButton'));
      await tester.tap(toSignUpButton);
      await tester.pumpAndSettle();

      final Finder passwordField = find.byKey(const Key('passwordField'));
      final Finder confirmPasswordField = find.byKey(const Key('confirmPasswordField'));
      final Finder signUpButton = find.byKey(const Key('signUpButton'));

      await tester.enterText(passwordField, password);
      await tester.enterText(confirmPasswordField, 'password');

      await tester.tap(signUpButton);
      await tester.pumpAndSettle();

      expect(find.text('Las contraseñas no coinciden'), findsOneWidget);
    });

    testWidgets('Registro exitoso', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final Finder toSignUpButton = find.byKey(const Key('toSignUpButton'));
      await tester.tap(toSignUpButton);
      await tester.pumpAndSettle();

      final Finder emailField = find.byKey(const Key('emailField'));
      final Finder passwordField = find.byKey(const Key('passwordField'));
      final Finder confirmPasswordField = find.byKey(const Key('confirmPasswordField'));
      final Finder signUpButton = find.byKey(const Key('signUpButton'));

      await tester.enterText(emailField, email);
      await tester.enterText(passwordField, password);
      await tester.enterText(confirmPasswordField, password);

      await tester.tap(signUpButton);

      await tester.pumpAndSettle();

      expect(find.byKey(const Key('WorkerCreatePage')), findsOneWidget);
    });

    testWidgets('Intento de registrar con un email ya en uso', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final Finder toSignUpButton = find.byKey(const Key('toSignUpButton'));
      await tester.tap(toSignUpButton);
      await tester.pumpAndSettle();

      final Finder emailField = find.byKey(const Key('emailField'));
      final Finder passwordField = find.byKey(const Key('passwordField'));
      final Finder confirmPasswordField = find.byKey(const Key('confirmPasswordField'));
      final Finder signUpButton = find.byKey(const Key('signUpButton'));

      await tester.enterText(emailField, email);
      await tester.enterText(passwordField, password);
      await tester.enterText(confirmPasswordField, password);

      await tester.tap(signUpButton);
      await tester.pumpAndSettle();

      expect(find.text('El email ya está en uso por otra cuenta.'), findsOneWidget);

      await tester.tap(signUpButton);
      await tester.pumpAndSettle();

      expect(find.text('El email ya está en uso por otra cuenta.'), findsOneWidget);
    });
  });
}

String generateRandomString(int length) {
  const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  Random rnd = Random();

  return String.fromCharCodes(Iterable.generate(
    length,
    (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
  ));
}

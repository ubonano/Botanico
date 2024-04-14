// ignore_for_file: depend_on_referenced_packages

import 'package:botanico/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

/* 

Tu run execute:
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=lib/modules/authentication/tests/sign_in_test.dart \
  -d chrome

*/

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  const email = 'user@test.com';
  const password = 'password123';

  setUpAll(() async {});

  group('Pruebas de Inicio de Sesión: ', () {
    testWidgets('Navegación a registro', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final Finder toSignUpButton = find.byKey(const Key('toSignUpButton'));

      await tester.tap(toSignUpButton);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('SignUpPage')), findsOneWidget);
    });

    testWidgets('Campos vacíos', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final Finder signInButton = find.byKey(const Key('signInButton'));

      await tester.tap(signInButton);
      await tester.pumpAndSettle();

      expect(find.text('Este campo es obligatorio'), findsWidgets);
    });

    testWidgets('Email inválido', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final Finder emailField = find.byKey(const Key('emailField'));
      final Finder signInButton = find.byKey(const Key('signInButton'));

      await tester.enterText(emailField, 'invalid-email');

      await tester.tap(signInButton);
      await tester.pumpAndSettle();

      expect(find.text('Ingresa un email válido'), findsOneWidget);
    });

    testWidgets('Contraseña inválida', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final Finder passwordField = find.byKey(const Key('passwordField'));
      final Finder signInButton = find.byKey(const Key('signInButton'));

      await tester.enterText(passwordField, '123');

      await tester.tap(signInButton);
      await tester.pumpAndSettle();

      expect(find.text('La contraseña debe tener al menos 6 caracteres'), findsOneWidget);
    });

    testWidgets('Inicio de sesión exitoso', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final Finder emailField = find.byKey(const Key('emailField'));
      final Finder passwordField = find.byKey(const Key('passwordField'));
      final Finder signInButton = find.byKey(const Key('signInButton'));

      await tester.enterText(emailField, email);
      await tester.enterText(passwordField, password);

      await tester.tap(signInButton);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('WorkerCreatePage')), findsOneWidget);
    });

    testWidgets('Inicio de sesión con contraseña incorrecta', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final Finder emailField = find.byKey(const Key('emailField'));
      final Finder passwordField = find.byKey(const Key('passwordField'));
      final Finder signInButton = find.byKey(const Key('signInButton'));

      await tester.enterText(emailField, email);
      await tester.enterText(passwordField, 'wrongPassword');
      await tester.pump();

      await tester.tap(signInButton);
      await tester.pumpAndSettle();

      expect(find.text('La contraseña es incorrecta.'), findsOneWidget);
    });

    testWidgets('Cerrar sesión', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final Finder emailField = find.byKey(const Key('emailField'));
      final Finder passwordField = find.byKey(const Key('passwordField'));
      final Finder signInButton = find.byKey(const Key('signInButton'));

      await tester.enterText(emailField, email);
      await tester.enterText(passwordField, password);

      await tester.tap(signInButton);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('WorkerCreatePage')), findsOneWidget);

      final Finder signOutButton = find.byKey(const Key('signOutButton'));
      await tester.tap(signOutButton);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('SignInPage')), findsOneWidget);
    });
  });
}

// ignore_for_file: depend_on_referenced_packages
import 'package:botanico/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';

Future<void> appInitFlow(WidgetTester tester) async {
  app.main();
  await tester.pumpAndSettle(const Duration(seconds: 3));
}

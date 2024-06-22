// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/worker/module.dart';

import '../../module.dart';

Future<void> companyCreateFromSignUpFlow(WidgetTester tester, String email, String password) async {
  await appInitFlow(tester);
  await signUpFlow(tester, email, password, password);
  await workerCreateFlow(tester);
  await companyCreateNavigateFlow(tester);
  await companyCreateFillDataFlow(tester);
  await companyCreatePressSaveButtonFlow(tester);
}

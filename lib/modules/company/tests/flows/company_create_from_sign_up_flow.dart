// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';

import '../../../authentication/tests/flows/sign_up_flow.dart';
import '../../../worker/tests/flows/worker_create_from_sign_up_flow.dart';
import '../../module.dart';

Future<void> companyCreateFromSignUpFlow(WidgetTester tester, String email, String password) async {
  await appInitFlow(tester);
  await signUpFlow(tester, email, password, password);
  await workerCreateFlow(tester);
  await companyCreateNavigateFlow(tester);
  await companyCreateFillDataFlow(tester);
  await companyCreatePressSaveButtonFlow(tester);
}

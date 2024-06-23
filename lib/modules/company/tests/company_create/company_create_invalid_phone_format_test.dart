// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';

import '../../../../tests/flows/app_init_flow.dart';
import '../../../authentication/tests/flows/sign_up_flow.dart';
import '../../../worker/tests/flows/worker_create_from_sign_up_flow.dart';
import '../flows/company_create_fill_data_flow.dart';
import '../flows/company_create_navigate_flow.dart';
import '../flows/company_create_press_save_button_flow.dart';

void companyCreateInvalidPhoneTest(String email, String password) {
  testWidgets('Create company with invalid phone from sign up', (WidgetTester tester) async {
    await appInitFlow(tester);

    await signUpFlow(tester, email, password, password);
    await workerCreateFlow(tester);
    await companyCreateNavigateFlow(tester);
    await companyCreateFillDataFlow(tester, phone: 'abc123');
    await companyCreatePressSaveButtonFlow(tester);
    expect(find.text('Este campo debe ser numérico'), findsOneWidget);
  });
}

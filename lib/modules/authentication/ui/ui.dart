import 'package:get/get.dart';

import 'pages/sign_in_page/sign_in_page.dart';
import 'pages/sign_up_page/sign_up_page.dart';

export 'pages/sign_up_page/sign_up_page.dart';
export 'pages/sign_up_page/widgets/confirm_password_input_field.dart';
export 'pages/sign_up_page/widgets/sign_up_button.dart';
export 'pages/sign_up_page/widgets/sign_up_navigate_button.dart';
export 'pages/sign_in_page/sign_in_page.dart';
export 'pages/sign_in_page/widgets/email_input_field.dart';
export 'pages/sign_in_page/widgets/password_input_field.dart';
export 'pages/sign_in_page/widgets/sign_in_button.dart';
export 'pages/sign_in_page/widgets/sign_in_navigate_button.dart';
export 'pages/sign_in_page/widgets/sign_in_recover_button.dart';
export 'widgets/sign_in_recover_dialog/sign_in_recover_dialog.dart';
export 'widgets/sign_out_button/sign_out_button.dart';
export 'widgets/sign_out_button/sign_out_controller.dart';
export 'pages/sign_up_page/sign_up_controller.dart';
export 'pages/sign_in_page/sign_in_controller.dart';
export 'widgets/sign_in_recover_dialog/sign_in_recover_controller.dart';

final List<GetPage> pages = [
  SignInPage.page,
  SignUpPage.page,
];

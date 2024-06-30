import 'package:get/get.dart';

import 'pages/accounting_account_form_page/accounting_account_form_page.dart';
import 'pages/accounting_account_list_page/accounting_account_list_page.dart';

export 'pages/accounting_account_list_page/accounting_account_list_page.dart';
export 'pages/accounting_account_list_page/widgets/accounting_account_create_fab.dart';
export 'pages/accounting_account_list_page/widgets/accounting_account_delete_icon_button.dart';
export 'pages/accounting_account_list_page/widgets/accounting_account_list.dart';
export 'pages/accounting_account_list_page/widgets/accounting_account_list_page_tile_button.dart';
export 'pages/accounting_account_list_page/widgets/accounting_account_list_tile_trailing_icon_buttons.dart';
export 'pages/accounting_account_form_page/accounting_account_form_page.dart';
export 'pages/accounting_account_form_page/widgets/accounting_account_save_button.dart';
export 'pages/accounting_account_form_page/widgets/accounting_account_enabled_form_fields.dart';
export 'pages/accounting_account_form_page/accounting_account_form_controller.dart';
export 'pages/accounting_account_list_page/accounting_account_list_controller.dart';

final List<GetPage> pages = [
  AccountingAccountFormPage.page,
  AccountingAccountListPage.page,
];

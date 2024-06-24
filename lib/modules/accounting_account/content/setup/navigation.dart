// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../../ui/ui.dart';

mixin AccountingAccountNavigation {
  static const ACCOUNTING_ACCOUNT_FORM = '/accounting-account-form';
  static const ACCOUNTING_ACCOUNT_LIST = '/accounting-account-list';

  void toAccountingAccountList({bool canPop = false}) => to(ACCOUNTING_ACCOUNT_LIST, canPop: canPop);
  void toAccountingAccountForm({String id = '', bool canPop = false}) =>
      to(ACCOUNTING_ACCOUNT_FORM, arguments: id, canPop: canPop);

  void to(String route, {dynamic arguments, bool canPop = false});
}

final pages = [
  GetPage(
    name: AccountingAccountNavigation.ACCOUNTING_ACCOUNT_FORM,
    page: () => const AccountingAccountFormPage(),
  ),
  GetPage(
    name: AccountingAccountNavigation.ACCOUNTING_ACCOUNT_LIST,
    page: () => const AccountingAccountListPage(),
  ),
];

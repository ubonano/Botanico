// ignore_for_file: constant_identifier_names

mixin AccountingAccountNavigationHelper {
  static const ACCOUNTING_ACCOUNT_FORM = '/accounting-account-form';
  static const ACCOUNTING_ACCOUNT_LIST = '/accounting-account-list';

  void toAccountingAccountList({bool canPop = false}) => to(ACCOUNTING_ACCOUNT_LIST, canPop: canPop);
  void toAccountingAccountForm({String id = '', bool canPop = false}) => to(ACCOUNTING_ACCOUNT_FORM, arguments: id, canPop: canPop);

  void to(String route, {dynamic arguments, bool canPop = false});
}


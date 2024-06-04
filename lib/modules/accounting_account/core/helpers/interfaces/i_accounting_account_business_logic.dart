import 'package:get/get.dart';

import '../../accounting_account_model.dart';

abstract class IAccountingAccountBusinessLogic {
  RxList<AccountingAccountModel> get accountingAccountList$;

  Future<AccountingAccountModel?> get(String id);
  Future<void> createAccountingAccount(AccountingAccountModel accountingAccount);
  Future<void> updateAccountingAccount(AccountingAccountModel accountingAccount);
  Future<void> deleteAccountingAccount(String id);
  Future<void> postCreateAccountingAccount();
  Future<void> postUpdateAccountingAccount();
  Future<void> initializeAccountingAccountStream();
  void cancelAccountingAccountStream();
}


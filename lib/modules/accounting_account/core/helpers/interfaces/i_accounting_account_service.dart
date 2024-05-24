import '../../../module.dart';

abstract class IAccountingAccountService {
  List<AccountingAccountModel> get accountingAccountList$;

  Future<AccountingAccountModel?> get(String id);
  Future<void> createAccountingAccount(AccountingAccountModel accountingAccount);
  Future<void> updateAccountingAccount(AccountingAccountModel accountingAccount);
  Future<void> deleteAccountingAccount(String id);
  Future<void> initializeAccountingAccountStream();
  void cancelAccountingAccountStream();
}


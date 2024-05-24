import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../module.dart';

abstract class IAccountingAccountRepository {
  String get generateId;

  Future<AccountingAccountModel?> get(String id);
  Future<void> create(AccountingAccountModel accountingAccount, {Transaction? txn});
  Future<void> update(AccountingAccountModel accountingAccount, {Transaction? txn});
  Future<void> delete(String id, {Transaction? txn});
  Stream<List<AccountingAccountModel>> accountingAccountListStream(String companyId);
}

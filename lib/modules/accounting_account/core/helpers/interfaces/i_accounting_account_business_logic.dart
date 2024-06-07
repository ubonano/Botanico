import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../accounting_account_model.dart';

abstract class IAccountingAccountBusinessLogic {
  Future<AccountingAccountModel?> get(String id);
  Future<void> create(AccountingAccountModel accountingAccount);
  Future<void> update(AccountingAccountModel accountingAccount);
  Future<void> delete(AccountingAccountModel accountingAccount);
  StreamSubscription<List<AccountingAccountModel>>? initializeStream({
    required RxList<AccountingAccountModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    Function(List<AccountingAccountModel>)? onNewData,
  });
}

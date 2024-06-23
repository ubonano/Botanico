import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'lib/setup/interfaces/i_accounting_account_business_logic.dart';
import 'lib/setup/interfaces/i_accounting_account_repository.dart';

class AccountingAccountBusinessLogic implements IAccountingAccountBusinessLogic {
  late final IAccountingAccountRepository _accountingAccountRepo = Get.find();

  @override
  Future<AccountingAccountModel?> get(String id) async => _accountingAccountRepo.get(id);

  @override
  Future<void> create(AccountingAccountModel accountingAccount) async =>
      await _accountingAccountRepo.create(accountingAccount.copyWith(uid: _accountingAccountRepo.generateId));

  @override
  Future<void> update(AccountingAccountModel accountingAccount) async =>
      await _accountingAccountRepo.update(accountingAccount);

  @override
  Future<void> delete(AccountingAccountModel accountingAccount) async =>
      await _accountingAccountRepo.delete(accountingAccount);

  @override
  StreamSubscription<List<AccountingAccountModel>>? initStream({
    required RxList<AccountingAccountModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    Function(List<AccountingAccountModel>)? onNewData,
  }) =>
      _accountingAccountRepo.initStream(startAfter: startAfter, limit: limit).listen(
        (accountingAccountList) {
          startAfter == null ? list$.value = accountingAccountList : list$.addAll(accountingAccountList);
          onNewData?.call(accountingAccountList);
        },
      );
}

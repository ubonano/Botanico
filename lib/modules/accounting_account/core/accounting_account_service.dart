import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/company/module.dart';

import '../module.dart';

class AccountingAccountService extends GetxService with GlobalHelper implements IAccountingAccountService {
  late final IModuleStructure _module = AccountingAccountModule();
  late final IAccountingAccountBusinessLogic _accountingAccountBusinessLogic = Get.find();

  @override
  Future<AccountingAccountModel?> get(String id) async => await operation.perform(
        operationName: 'Get accounting account $id',
        module: _module,
        permissionKey: AccountingAccountModule.viewKey,
        operation: (_) async => await _accountingAccountBusinessLogic.get(id),
      );

  @override
  Future<void> create(AccountingAccountModel accountingAccount) async => await operation.perform(
        operationName: 'Create accounting account ${accountingAccount.uid}',
        module: _module,
        permissionKey: AccountingAccountModule.createKey,
        operation: (_) async => await _accountingAccountBusinessLogic.create(accountingAccount),
      );

  @override
  Future<void> update(AccountingAccountModel accountingAccount) async => await operation.perform(
        operationName: 'Update accounting account ${accountingAccount.uid}',
        module: _module,
        permissionKey: AccountingAccountModule.updateKey,
        operation: (_) async => await _accountingAccountBusinessLogic.update(accountingAccount),
      );

  @override
  Future<void> delete(AccountingAccountModel accountingAccount) async => await operation.perform(
        operationName: 'Delete accounting account ${accountingAccount.uid}',
        module: _module,
        permissionKey: AccountingAccountModule.deleteKey,
        operation: (_) async => await _accountingAccountBusinessLogic.delete(accountingAccount),
      );

  @override
  StreamSubscription<List<AccountingAccountModel>>? initStream({
    required RxList<AccountingAccountModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    Function(List<AccountingAccountModel>)? onNewData,
  }) =>
      _accountingAccountBusinessLogic.initStream(
        list$: list$,
        startAfter: startAfter,
        limit: limit,
        onNewData: onNewData,
      );
}

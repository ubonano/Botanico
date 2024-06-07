import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../module.dart';

class AccountingAccountService extends GetxService with GlobalHelper implements IAccountingAccountService {
  late final IAccountingAccountBusinessLogic _accountingAccountBusinessLogic = Get.find();

  @override
  Future<AccountingAccountModel?> get(String id) async => await _accountingAccountBusinessLogic.get(id);

  @override
  Future<void> create(AccountingAccountModel accountingAccount) async => await operation.perform(
        operationName: 'Create accounting account ${accountingAccount.uid}',
        permissionKey: AccountingAccountModulePermissions.createKey,
        operation: (_) async => await _accountingAccountBusinessLogic.create(accountingAccount),
        onSuccess: _accountingAccountBusinessLogic.postCreate,
      );

  @override
  Future<void> update(AccountingAccountModel accountingAccount) async => await operation.perform(
        operationName: 'Update accounting account ${accountingAccount.uid}',
        permissionKey: AccountingAccountModulePermissions.updateKey,
        operation: (_) async => await _accountingAccountBusinessLogic.update(accountingAccount),
        onSuccess: _accountingAccountBusinessLogic.postUpdate,
      );

  @override
  Future<void> delete(String id) async => await operation.perform(
        operationName: 'Delete accounting account $id',
        permissionKey: AccountingAccountModulePermissions.deleteKey,
        operation: (_) async => await _accountingAccountBusinessLogic.delete(id),
      );

  @override
  StreamSubscription<List<AccountingAccountModel>>? initializeStream({
    required RxList<AccountingAccountModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    Function(List<AccountingAccountModel>)? onNewData,
  }) =>
      _accountingAccountBusinessLogic.initializeStream(
        list$: list$,
        startAfter: startAfter,
        limit: limit,
        onNewData: onNewData,
      );
}

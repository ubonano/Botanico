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
      );

  @override
  Future<void> update(AccountingAccountModel accountingAccount) async => await operation.perform(
        operationName: 'Update accounting account ${accountingAccount.uid}',
        permissionKey: AccountingAccountModulePermissions.updateKey,
        operation: (_) async => await _accountingAccountBusinessLogic.update(accountingAccount),
      );

  @override
  Future<void> delete(AccountingAccountModel accountingAccount) async => await operation.perform(
        operationName: 'Delete accounting account ${accountingAccount.uid}',
        permissionKey: AccountingAccountModulePermissions.deleteKey,
        operation: (_) async => await _accountingAccountBusinessLogic.delete(accountingAccount),
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

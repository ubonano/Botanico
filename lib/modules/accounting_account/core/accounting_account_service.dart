import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../module.dart';

class AccountingAccountService extends GetxService with GlobalHelper implements IAccountingAccountService {
  late final IAccountingAccountBusinessLogic _accountingAccountBusinessLogic = Get.find();

  @override
  List<AccountingAccountModel> get accountingAccountList$ => _accountingAccountBusinessLogic.accountingAccountList$;

  @override
  Future<AccountingAccountModel?> get(String id) async => await _accountingAccountBusinessLogic.get(id);

  @override
  Future<void> createAccountingAccount(AccountingAccountModel accountingAccount) async {
    await operation.perform(
      operationName: 'Create accounting account',
      permissionKey: AccountingAccountModulePermissions.createKey,
      operation: (_) async => await _accountingAccountBusinessLogic.createAccountingAccount(accountingAccount),
      onSuccess: _accountingAccountBusinessLogic.postCreateAccountingAccount,
    );
  }

  @override
  Future<void> updateAccountingAccount(AccountingAccountModel accountingAccount) async {
    await operation.perform(
      operationName: 'Update accounting account',
      permissionKey: AccountingAccountModulePermissions.updateKey,
      operation: (_) async => await _accountingAccountBusinessLogic.updateAccountingAccount(accountingAccount),
      onSuccess: _accountingAccountBusinessLogic.postUpdateAccountingAccount,
    );
  }

  @override
  Future<void> deleteAccountingAccount(String id) async {
    await operation.perform(
      operationName: 'Delete accounting account',
      permissionKey: AccountingAccountModulePermissions.deleteKey,
      successMessage: 'Cuenta contable eliminada',
      inTransaction: true,
      operation: (_) async => await _accountingAccountBusinessLogic.deleteAccountingAccount(id),
    );
  }

  @override
  Future<void> initializeAccountingAccountStream() async {
    await operation.perform(
      operationName: 'Fetch accounting account',
      permissionKey: AccountingAccountModulePermissions.viewKey,
      operation: (_) async => await _accountingAccountBusinessLogic.initializeAccountingAccountStream(),
    );
  }

  @override
  void cancelAccountingAccountStream() => _accountingAccountBusinessLogic.cancelAccountingAccountStream();
}


import 'dart:async';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/company/module.dart';

import '../module.dart';

class AccountingAccountBusinessLogic with GlobalHelper implements IAccountingAccountBusinessLogic {
  late final IAccountingAccountRepository _accountingAccountRepo = Get.find();
  late final ICompanyBusinessLogic _companyBusinessLogic = Get.find();

  final _accountingAccountList$ = RxList<AccountingAccountModel>();
  StreamSubscription<List<AccountingAccountModel>>? _accountingAccountListSubscription;

  @override
  RxList<AccountingAccountModel> get accountingAccountList$ => _accountingAccountList$;

  @override
  Future<AccountingAccountModel?> get(String id) async => _accountingAccountRepo.get(id);

  @override
  Future<void> createAccountingAccount(AccountingAccountModel accountingAccount) async =>
      await _accountingAccountRepo.create(accountingAccount.copyWith(uid: _accountingAccountRepo.generateId));

  @override
  Future<void> updateAccountingAccount(AccountingAccountModel accountingAccount) async => await _accountingAccountRepo.update(accountingAccount);

  @override
  Future<void> deleteAccountingAccount(String id) async => await _accountingAccountRepo.delete(id);

  @override
  Future<void> postCreateAccountingAccount() async => navigate.toAccountingAccountList();

  @override
  Future<void> postUpdateAccountingAccount() async => navigate.toAccountingAccountList();

  @override
  Future<void> initializeAccountingAccountStream() async => _accountingAccountListSubscription = _accountingAccountRepo
      .accountingAccountListStream(_companyBusinessLogic.currentCompanyId)
      .listen((accountingAccountList) => _accountingAccountList$.value = accountingAccountList);

  @override
  void cancelAccountingAccountStream() {
    _accountingAccountListSubscription?.cancel();
    _accountingAccountList$.clear();
  }
}


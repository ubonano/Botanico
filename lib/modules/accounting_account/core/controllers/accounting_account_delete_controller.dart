import 'package:get/get.dart';
import 'package:botanico/modules/foundation/module.dart';

import '../../module.dart';

class AccountingAccountDeleteController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'AccountingAccountDeleteController';

  late final IAccountingAccountService _accountingAccountService = Get.find();

  Future<void> submit(AccountingAccountModel accountingAccount) async => await _accountingAccountService.deleteAccountingAccount(accountingAccount.uid);
}


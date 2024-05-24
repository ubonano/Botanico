import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

import '../../module.dart';

class AccountingAccountListController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'AccountingAccountListController';

  late final IAccountingAccountBusinessLogic _accountingAccountBusinessLogic = Get.find();

  RxList<AccountingAccountModel> get accountingAccountList$ => _accountingAccountBusinessLogic.accountingAccountList$;

  @override
  void onInit() {
    super.onInit();
    _accountingAccountBusinessLogic.initializeAccountingAccountStream();
  }

  @override
  void onClose() {
    _accountingAccountBusinessLogic.cancelAccountingAccountStream();
    super.onClose();
  }
}

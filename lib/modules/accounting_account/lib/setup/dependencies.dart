import 'package:get/get.dart';

import '../../accounting_account_business_logic.dart';
import '../../accounting_account_service.dart';
import '../../accounting_account_repository.dart';
import '../../ui/accounting_account_form_page/accounting_account_form_controller.dart';
import '../../ui/accounting_account_list_page/accounting_account_list_controller.dart';
import 'interfaces/i_accounting_account_business_logic.dart';
import 'interfaces/i_accounting_account_repository.dart';
import 'interfaces/i_accounting_account_service.dart';

import 'permissions.dart';

void setupDependencies() {
  Get.lazyPut<AccountingAccountPermissions>(() => AccountingAccountPermissions(), fenix: true);

  Get.lazyPut<IAccountingAccountRepository>(() => AccountingAccountRepository(), fenix: true);
  Get.lazyPut<IAccountingAccountBusinessLogic>(() => AccountingAccountBusinessLogic(), fenix: true);
  Get.lazyPut<IAccountingAccountService>(() => AccountingAccountService(), fenix: true);

  Get.lazyPut<AccountingAccountFormController>(() => AccountingAccountFormController(), fenix: true);
  Get.lazyPut<AccountingAccountListController>(() => AccountingAccountListController(), fenix: true);
}

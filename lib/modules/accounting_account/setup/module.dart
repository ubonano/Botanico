import 'package:get/get.dart';

import 'interfaces/i_accounting_account_business_logic.dart';
import 'interfaces/i_accounting_account_repository.dart';
import 'interfaces/i_accounting_account_service.dart';
import '../../app/content/setup/interfaces/i_module_structure.dart';
export '../../app/content/setup/interfaces/i_module_structure.dart';
import '../accounting_account_business_logic.dart';
import '../accounting_account_repository.dart';
import '../accounting_account_service.dart';
import '../ui/ui.dart';

class AccountingAccountModule implements IModuleStructure {
  @override
  String get id => moduleId;
  static const String moduleId = 'accounting_account';

  @override
  String get label => moduleLabel;
  static const String moduleLabel = 'Cuentas Contables';

  @override
  List<KeyModel> get keys => AccountingAccountKeys.values.map((key) => KeyModel(id: key.id, label: key.label)).toList();

  static void dependencies() {
    Get.lazyPut<AccountingAccountModule>(() => AccountingAccountModule(), fenix: true);

    Get.lazyPut<IAccountingAccountRepository>(() => AccountingAccountRepository(), fenix: true);
    Get.lazyPut<IAccountingAccountBusinessLogic>(() => AccountingAccountBusinessLogic(), fenix: true);
    Get.lazyPut<IAccountingAccountService>(() => AccountingAccountService(), fenix: true);

    Get.lazyPut<AccountingAccountFormController>(() => AccountingAccountFormController(), fenix: true);
    Get.lazyPut<AccountingAccountListController>(() => AccountingAccountListController(), fenix: true);
  }

  static final List<GetPage> pages = [
    AccountingAccountFormPage.page,
    AccountingAccountListPage.page,
  ];
}

enum AccountingAccountKeys {
  view('${AccountingAccountModule.moduleId}.view', 'Ver'),
  create('${AccountingAccountModule.moduleId}.create', 'Crear'),
  update('${AccountingAccountModule.moduleId}.update', 'Actualizar'),
  delete('${AccountingAccountModule.moduleId}.delete', 'Eliminar');

  final String id;
  final String label;

  const AccountingAccountKeys(this.id, this.label);
}

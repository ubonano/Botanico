import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

import 'ui/accounting_account_form_page/accounting_account_form_controller.dart';
import 'ui/accounting_account_list_page/accounting_account_list_controller.dart';

import 'core/interfaces/i_accounting_account_business_logic.dart';
import 'core/interfaces/i_accounting_account_repository.dart';
import 'core/interfaces/i_accounting_account_service.dart';

import 'core/accounting_account_business_logic.dart';
import 'core/model/accounting_account_repository.dart';
import 'core/accounting_account_service.dart';

export 'ui/accounting_account_form_page/accounting_account_form_controller.dart';
export 'ui/accounting_account_list_page/accounting_account_list_controller.dart';

export 'core/accounting_account_business_logic.dart';

export 'core/interfaces/i_accounting_account_business_logic.dart';
export 'core/interfaces/i_accounting_account_repository.dart';
export 'core/interfaces/i_accounting_account_service.dart';

export 'navigation_helper.dart';

export 'core/model/accounting_account_model.dart';

export 'core/model/accounting_account_repository.dart';
export 'core/accounting_account_service.dart';

export 'tests/flows/accounting_account_list_navigate_flow.dart';
export 'tests/flows/accounting_account_create_navigate_flow.dart';
export 'tests/flows/accounting_account_save_flow.dart';
export 'tests/flows/accounting_account_fill_data_flow.dart';

export 'tests/accounting_account_create/accounting_account_empty_fields_test.dart';
export 'tests/accounting_account_create/accounting_account_create_success_test.dart';
export 'tests/accounting_account_list/accounting_account_list_find_by_name_test.dart';
export 'tests/accounting_account_list/accounting_account_list_find_enter_validate_all_fields_test.dart';
export 'tests/accounting_account_update/accounting_account_update_success_test.dart';
export 'tests/accounting_account_delete/accounting_account_delete_test.dart';

export 'ui/accounting_account_list_page/widgets/accounting_account_create_fab.dart';
export 'ui/accounting_account_list_page/widgets/accounting_account_list_page_tile_button.dart';
export 'ui/accounting_account_list_page/widgets/accounting_account_delete_icon_button.dart';
export 'ui/accounting_account_list_page/widgets/accounting_account_list_tile_trailing_icon_buttons.dart';
export 'ui/accounting_account_form_page/widgets/accounting_account_enabled_form_fields.dart';

export 'ui/accounting_account_form_page/widgets/accounting_account_save_button.dart';
export 'ui/accounting_account_form_page/widgets/name_input_field.dart';
export 'ui/accounting_account_list_page/widgets/accounting_account_list.dart';

export 'ui/accounting_account_form_page/accounting_account_form_page.dart';
export 'ui/accounting_account_list_page/accounting_account_list_page.dart';

void dependencies() {
  Get.lazyPut<IAccountingAccountBusinessLogic>(() => AccountingAccountBusinessLogic(), fenix: true);

  Get.lazyPut<IAccountingAccountRepository>(() => AccountingAccountRepository(), fenix: true);
  Get.lazyPut<IAccountingAccountService>(() => AccountingAccountService(), fenix: true);

  Get.lazyPut<AccountingAccountFormController>(() => AccountingAccountFormController(), fenix: true);
  Get.lazyPut<AccountingAccountListController>(() => AccountingAccountListController(), fenix: true);
}

class AccountingAccountModulePermissions implements ModuleStructure {
  @override
  String get moduleId => 'accounting_account';

  @override
  String get moduleName => 'Cuentas Contables';

  static const viewKey = 'accounting_account.view';
  static const createKey = 'accounting_account.create';
  static const updateKey = 'accounting_account.update';
  static const deleteKey = 'accounting_account.delete';

  @override
  List<WorkerPermissionModel> get permissions => [
        WorkerPermissionModel(id: viewKey, name: 'Ver'),
        WorkerPermissionModel(id: createKey, name: 'Crear'),
        WorkerPermissionModel(id: updateKey, name: 'Actualizar'),
        WorkerPermissionModel(id: deleteKey, name: 'Eliminar'),
      ];

  @override
  ModuleModel toModel() => ModuleModel(id: moduleId, name: moduleName, permissions: permissions);
}

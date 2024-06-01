import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

import 'core/controllers/accounting_account_form_controller.dart';
import 'core/controllers/accounting_account_list_controller.dart';
import 'core/controllers/accounting_account_delete_controller.dart';

import 'core/helpers/interfaces/i_accounting_account_business_logic.dart';
import 'core/helpers/interfaces/i_accounting_account_repository.dart';
import 'core/helpers/interfaces/i_accounting_account_service.dart';

import 'core/accounting_account_business_logic.dart';
import 'core/accounting_account_repository.dart';
import 'core/accounting_account_service.dart';

export 'core/controllers/accounting_account_form_controller.dart';
export 'core/controllers/accounting_account_list_controller.dart';
export 'core/controllers/accounting_account_delete_controller.dart';

export 'core/accounting_account_business_logic.dart';

export 'core/helpers/interfaces/i_accounting_account_business_logic.dart';
export 'core/helpers/interfaces/i_accounting_account_repository.dart';
export 'core/helpers/interfaces/i_accounting_account_service.dart';

export 'core/helpers/accounting_account_navigation_helper.dart';

export 'core/accounting_account_model.dart';
export 'core/accounting_account_permissions.dart';

export 'core/accounting_account_repository.dart';
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

export 'ui/widgets/buttons/accounting_account_create_fab.dart';
export 'ui/widgets/buttons/accounting_account_list_page_tile_button.dart';
export 'ui/widgets/buttons/accounting_account_delete_icon_button.dart';
export 'ui/widgets/buttons/accounting_account_list_tile_trailing_icon_buttons.dart';
export 'ui/widgets/buttons/accounting_account_enabled_form_fields.dart';

export 'ui/widgets/buttons/accounting_account_save_button.dart';
export 'ui/widgets/fields/name_input_field.dart';
export 'ui/widgets/accounting_account_list.dart';

export 'ui/accounting_account_form_page.dart';
export 'ui/accounting_account_list_page.dart';

void dependencies() {
  Get.put<IAccountingAccountBusinessLogic>(AccountingAccountBusinessLogic(), permanent: true);

  Get.lazyPut<IAccountingAccountRepository>(() => AccountingAccountRepository(), fenix: true);
  Get.lazyPut<IAccountingAccountService>(() => AccountingAccountService(), fenix: true);

  Get.lazyPut<AccountingAccountFormController>(() => AccountingAccountFormController(), fenix: true);
  Get.lazyPut<AccountingAccountListController>(() => AccountingAccountListController(), fenix: true);
  Get.lazyPut<AccountingAccountDeleteController>(() => AccountingAccountDeleteController(), fenix: true);
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
  List<PermissionModel> get permissions => [
        PermissionModel(id: viewKey, name: 'Ver'),
        PermissionModel(id: createKey, name: 'Crear'),
        PermissionModel(id: updateKey, name: 'Actualizar'),
        PermissionModel(id: deleteKey, name: 'Eliminar'),
      ];

  @override
  ModuleModel toModel() => ModuleModel(name: 'Cuentas Contables', permissions: permissions);
}

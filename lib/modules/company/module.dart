import 'package:botanico/modules/worker/module.dart';
import 'package:get/get.dart';

import 'core/interfaces/i_company_business_logic.dart';
import 'core/interfaces/i_company_repository.dart';
import 'core/interfaces/i_company_service.dart';
import 'core/interfaces/i_permissions_structure.dart';
import 'ui/company_form_page/company_form_controller.dart';
export 'ui/company_form_page/company_form_controller.dart';

export 'core/exceptions/company_not_found_exception.dart';

export 'core/interfaces/i_company_business_logic.dart';
export 'core/interfaces/i_company_repository.dart';
export 'core/interfaces/i_company_service.dart';
export 'navigation_helper.dart';

import 'core/company_business_logic.dart';

export 'core/model/company_model.dart';

import 'core/model/company_repository.dart';

import 'core/company_service.dart';

export 'tests/company_create/company_create_empty_fields_test.dart';
export 'tests/company_create/company_create_invalid_phone_format_test.dart';
export 'tests/company_create/company_create_success_from_sign_up_test.dart';
export 'tests/company_create/company_create_success_from_sign_in_test.dart';

export 'tests/flows/company_create_from_sign_up_flow.dart';
export 'tests/flows/company_create_navigate_flow.dart';
export 'tests/flows/company_create_fill_data_flow.dart';
export 'tests/flows/company_create_press_save_button_flow.dart';

export 'ui/company_form_page/widgets/fields/address_input_field.dart';
export 'ui/company_form_page/widgets/fields/city_input_field.dart';
export 'ui/company_form_page/widgets/fields/country_input_field.dart';
export 'ui/company_form_page/widgets/fields/name_input_field.dart';
export 'ui/company_form_page/widgets/fields/phone_input_field.dart';
export 'ui/company_form_page/widgets/fields/province_input_field.dart';

export 'ui/company_form_page/widgets/buttons/company_save_button.dart';
export 'ui/company_form_page/widgets/buttons/company_create_navigate_button.dart';
export 'ui/company_form_page/widgets/buttons/company_enabled_form_fields.dart';
export 'ui/company_form_page/widgets/buttons/company_form_page_tile_button.dart';

export 'ui/company_form_page/company_form_page.dart';

import 'ui/home_page/home_controller.dart';
import 'ui/widgets/custom_drawer/custom_drawer_controller.dart';

export 'ui/widgets/custom_drawer/custom_drawer_controller.dart';
export 'ui/home_page/home_controller.dart';

export 'core/helpers/validator_helper.dart';
export 'core/interfaces/i_permissions_structure.dart';
export 'core/helpers/function_helper.dart';

export 'core/helpers/life_cycle_logging_controller_helper.dart';
export 'core/helpers/form_helper.dart';
export 'core/helpers/paginated_list_helper.dart';
export 'core/helpers/global_helper.dart';

import 'core/helpers/log_helper.dart';
import 'core/helpers/navigation_helper.dart';
import 'core/helpers/operation_helper.dart';
import 'core/model/module_repository.dart';
import 'core/helpers/snackbar_helper.dart';

export 'core/helpers/snackbar_helper.dart';
export 'core/helpers/operation_helper.dart';
export 'core/helpers/log_helper.dart';
export 'core/helpers/navigation_helper.dart';
export 'core/helpers/fields_key.dart';
export 'core/model/module_repository.dart';

export 'tests/flows/open_drawer_flow.dart';

export 'ui/widgets/buttons/custom_button.dart';
export 'ui/widgets/buttons/custom_text_button.dart';
export 'ui/home_page/widgets/home_page_tile_button.dart';

export 'ui/widgets/custom_input_field.dart';
export 'ui/widgets/custom_drawer/custom_drawer.dart';
export 'ui/widgets/confirmation_dialog.dart';
export 'ui/widgets/custom_scaffold.dart';
export 'ui/widgets/protected_widget.dart';
export 'ui/company_form_page/widgets/module_active_toggle.dart';

export 'ui/home_page/home_page.dart';

export '../../app.dart';
export '../../setup/bindings.dart';
export '../../setup/firebase_options.dart';
export '../../setup/pages.dart';
export '../../tests/flows/app_init_flow.dart';

void dependencies() {
  Get.put(NavigationHelper(), permanent: true);
  Get.put(LogHelper(), permanent: true);
  Get.put(SnackbarHelper(), permanent: true);
  Get.put(OperationHelper(), permanent: true);

  Get.put<ICompanyBusinessLogic>(CompanyBusinessLogic(), permanent: true);

  Get.lazyPut<ModuleRepository>(() => ModuleRepository(), fenix: true);
  Get.lazyPut<ICompanyRepository>(() => CompanyRepository(), fenix: true);
  Get.lazyPut<ICompanyService>(() => CompanyService(), fenix: true);

  Get.lazyPut<CustomDrawerController>(() => CustomDrawerController(), fenix: true);
  Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  Get.lazyPut<CompanyFormController>(() => CompanyFormController(), fenix: true);
}

class CompanyModule implements IPermissionsStructure {
  @override
  String get id => 'company';

  @override
  String get name => 'Empresa';

  static const updateKey = 'company.update';

  @override
  List<PermissionModel> get permissions => [
        PermissionModel(id: updateKey, name: 'Actualizar'),
      ];
}

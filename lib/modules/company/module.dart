import 'package:get/get.dart';

import 'package:botanico/modules/foundation/module.dart';

import 'core/interfaces/i_company_business_logic.dart';
import 'core/interfaces/i_company_repository.dart';
import 'core/interfaces/i_company_service.dart';
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

void dependencies() {
  Get.put<ICompanyBusinessLogic>(CompanyBusinessLogic(), permanent: true);

  Get.lazyPut<ICompanyRepository>(() => CompanyRepository(), fenix: true);
  Get.lazyPut<ICompanyService>(() => CompanyService(), fenix: true);

  Get.lazyPut<CompanyFormController>(() => CompanyFormController(), fenix: true);
}

class CompanyModulePermissions implements ModuleStructure {
  @override
  String get moduleId => 'company';

  @override
  String get moduleName => 'Empresa';

  static const updateKey = 'company.update';

  @override
  List<WorkerPermissionModel> get permissions => [
        WorkerPermissionModel(id: updateKey, name: 'Actualizar'),
      ];

  @override
  ModuleModel toModel() => ModuleModel(id: moduleId, name: moduleName, permissions: permissions);
}

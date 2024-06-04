import 'package:get/get.dart';

import 'core/helpers/interfaces/i_company_business_logic.dart';
import 'core/helpers/interfaces/i_company_repository.dart';
import 'core/helpers/interfaces/i_company_service.dart';
import 'core/controllers/company_form_controller.dart';
export 'core/controllers/company_form_controller.dart';

export 'core/helpers/exceptions/company_not_found_exception.dart';

export 'core/helpers/interfaces/i_company_business_logic.dart';
export 'core/helpers/interfaces/i_company_repository.dart';
export 'core/helpers/interfaces/i_company_service.dart';
export 'core/helpers/company_navigation_helper.dart';

import 'core/company_business_logic.dart';

export 'core/company_model.dart';

import 'core/company_repository.dart';

import 'core/company_service.dart';

export 'tests/company_create/company_create_empty_fields_test.dart';
export 'tests/company_create/company_create_invalid_phone_format_test.dart';
export 'tests/company_create/company_create_success_from_sign_up_test.dart';
export 'tests/company_create/company_create_success_from_sign_in_test.dart';

export 'tests/flows/company_create_from_sign_up_flow.dart';
export 'tests/flows/company_create_navigate_flow.dart';
export 'tests/flows/company_create_fill_data_flow.dart';
export 'tests/flows/company_create_press_save_button_flow.dart';

export 'ui/widgets/fields/address_input_field.dart';
export 'ui/widgets/fields/city_input_field.dart';
export 'ui/widgets/fields/country_input_field.dart';
export 'ui/widgets/fields/name_input_field.dart';
export 'ui/widgets/fields/phone_input_field.dart';
export 'ui/widgets/fields/province_input_field.dart';

export 'ui/widgets/buttons/company_save_button.dart';
export 'ui/widgets/buttons/company_create_navigate_button.dart';

export 'ui/company_form_page.dart';

void dependencies() {
  Get.put<ICompanyBusinessLogic>(CompanyBusinessLogic(), permanent: true);

  Get.lazyPut<ICompanyRepository>(() => CompanyRepository(), fenix: true);
  Get.lazyPut<ICompanyService>(() => CompanyService(), fenix: true);

  Get.lazyPut<CompanyFormController>(() => CompanyFormController(), fenix: true);
}

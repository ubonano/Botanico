import 'package:get/get.dart';

import 'core/helpers/interfaces/i_company_business_logic.dart';
import 'core/helpers/interfaces/i_company_repository.dart';
import 'core/helpers/interfaces/i_company_service.dart';
import 'ui/controllers/company_create_controller.dart';
export 'ui/controllers/company_create_controller.dart';

export 'core/helpers/exceptions/company_not_found_exception.dart';

export 'core/helpers/interfaces/i_company_business_logic.dart';
export 'core/helpers/interfaces/i_company_repository.dart';
export 'core/helpers/interfaces/i_company_service.dart';

import 'core/business_logic/company_business_logic.dart';

export 'core/models/company_model.dart';

import 'core/repositories/company_repository.dart';

import 'core/services/company_service.dart';

export 'tests/company_create/company_create_empty_fields_test.dart';
export 'tests/company_create/company_create_invalid_phone_format_test.dart';
export 'tests/company_create/company_create_success_from_sign_up_test.dart';
export 'tests/company_create/company_create_success_from_sign_in_test.dart';

export 'tests/flows/company_create_navigate_flow.dart';
export 'tests/flows/company_create_flow.dart';

export 'ui/company_create_page.dart';

void companyDependencies() {
  Get.lazyPut<ICompanyRepository>(() => CompanyRepository(), fenix: true);
  Get.lazyPut<ICompanyBusinessLogic>(() => CompanyBusinessLogic(), fenix: true);
  Get.lazyPut<ICompanyService>(() => CompanyService(), fenix: true);

  Get.lazyPut<CompanyCreateController>(() => CompanyCreateController(), fenix: true);
}

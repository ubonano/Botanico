import 'package:get/get.dart';

import 'core/controllers/company_create_controller.dart';
export 'core/controllers/company_create_controller.dart';

export 'core/exceptions/company_not_found_exception.dart';

import 'core/helpers/company_handler.dart';
export 'core/helpers/company_handler.dart';

export 'core/models/company_model.dart';

import 'core/repositories/company_repository.dart';
export 'core/repositories/company_repository.dart';

import 'core/services/company_service.dart';
export 'core/services/company_service.dart';

export 'tests/company_create/company_create_empty_fields_test.dart';
export 'tests/company_create/company_create_invalid_phone_format_test.dart';
export 'tests/company_create/company_create_success_from_sign_up_test.dart';
export 'tests/company_create/company_create_success_from_sign_in_test.dart';

export 'tests/flows/company_create_navigate_flow.dart';
export 'tests/flows/company_create_flow.dart';

export 'core/ui/company_create_page.dart';

void companyDependencies() {
  Get.lazyPut<CompanyRepository>(() => CompanyRepository(), fenix: true);
  Get.lazyPut<CompanyHandler>(() => CompanyHandler(), fenix: true);
  Get.lazyPut<CompanyService>(() => CompanyService(), fenix: true);
  Get.lazyPut<CompanyCreateController>(() => CompanyCreateController(), fenix: true);
}

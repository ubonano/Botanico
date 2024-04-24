import 'package:get/get.dart';

import 'core/controllers/company_create_controller.dart';
import 'core/repositories/company_repository.dart';

export 'core/models/company_model.dart';

export 'core/controllers/company_create_controller.dart';

export 'core/exceptions/company_not_found_exception.dart';

export 'core/repositories/company_repository.dart';

export 'tests/flows/navigate_to_create_company_flow.dart';
export 'tests/flows/create_company_flow.dart';

export 'tests/company_create/company_create_empty_fields_test.dart';
export 'tests/company_create/company_create_invalid_phone_format_test.dart';
export 'tests/company_create/company_create_success_from_sign_up_test.dart';
export 'tests/company_create/company_create_success_from_sign_in_test.dart';

export 'core/ui/company_create_page.dart';

void companyDependencies() {
  Get.lazyPut<CompanyRepository>(() => CompanyRepository(), fenix: true);
  Get.lazyPut<CompanyCreateController>(() => CompanyCreateController(), fenix: true);
}

import 'package:get/get.dart';

import 'controllers/company_create_controller.dart';
import 'repositories/company_repository.dart';

export 'models/company_model.dart';

export 'controllers/company_create_controller.dart';

export 'exceptions/company_not_found_exception.dart';

export 'repositories/company_repository.dart';

export 'tests/flows/navigate_to_create_company_flow.dart';
export 'tests/flows/create_company_flow.dart';

export 'tests/company_create/company_create_empty_fields_test.dart';
export 'tests/company_create/company_create_invalid_phone_format_test.dart';
export 'tests/company_create/company_create_success_from_sign_up_test.dart';
export 'tests/company_create/company_create_success_from_sign_in_test.dart';

export 'ui/company_create_page.dart';

void companyDependencies() {
  Get.lazyPut<CompanyRepository>(() => CompanyRepository(), fenix: true);
  Get.lazyPut<CompanyCreateController>(() => CompanyCreateController(), fenix: true);
}

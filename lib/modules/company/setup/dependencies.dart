import 'package:get/get.dart';

import '../core/company_business_logic.dart';
import '../core/company_service.dart';
import '../helpers/log_helper.dart';
import '../helpers/navigation_helper.dart';
import '../helpers/operation_helper.dart';
import '../helpers/snackbar_helper.dart';
import 'interfaces/i_company_business_logic.dart';
import 'interfaces/i_company_repository.dart';
import 'interfaces/i_company_service.dart';
import '../model/company_repository.dart';
import '../model/module_repository.dart';
import '../ui/ui.dart';
import 'permissions.dart';

void setupDependencies() {
  Get.put(NavigationHelper(), permanent: true);
  Get.put(LogHelper(), permanent: true);
  Get.put(SnackbarHelper(), permanent: true);
  Get.put(OperationHelper(), permanent: true);
  Get.lazyPut<ModuleRepository>(() => ModuleRepository(), fenix: true);

  Get.lazyPut<CompanyPermissions>(() => CompanyPermissions(), fenix: true);

  Get.lazyPut<ICompanyBusinessLogic>(() => CompanyBusinessLogic(), fenix: true);
  Get.lazyPut<ICompanyRepository>(() => CompanyRepository(), fenix: true);
  Get.lazyPut<ICompanyService>(() => CompanyService(), fenix: true);

  Get.lazyPut<CustomDrawerController>(() => CustomDrawerController(), fenix: true);
  Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  Get.lazyPut<CompanyFormController>(() => CompanyFormController(), fenix: true);
}

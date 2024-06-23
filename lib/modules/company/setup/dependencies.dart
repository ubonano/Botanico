import 'package:get/get.dart';

import '../../app/ui/ui.dart';
import '../core/company_business_logic.dart';
import '../core/company_service.dart';
import '../model/company_repository.dart';
import '../ui/ui.dart';
import 'interfaces/i_company_business_logic.dart';
import 'interfaces/i_company_repository.dart';
import 'interfaces/i_company_service.dart';
import 'permissions.dart';

void setupDependencies() {
  Get.lazyPut<CompanyPermissions>(() => CompanyPermissions(), fenix: true);

  Get.lazyPut<ICompanyBusinessLogic>(() => CompanyBusinessLogic(), fenix: true);
  Get.lazyPut<ICompanyRepository>(() => CompanyRepository(), fenix: true);
  Get.lazyPut<ICompanyService>(() => CompanyService(), fenix: true);

  Get.lazyPut<CustomDrawerController>(() => CustomDrawerController(), fenix: true);
  Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  Get.lazyPut<CompanyFormController>(() => CompanyFormController(), fenix: true);
}

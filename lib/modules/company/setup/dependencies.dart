import 'package:get/get.dart';

import '../../app/ui/ui.dart';
import '../company_business_logic.dart';
import '../company_service.dart';
import '../company_repository.dart';
import '../ui/ui.dart';
import 'interfaces/i_company_business_logic.dart';
import 'interfaces/i_company_repository.dart';
import 'interfaces/i_company_service.dart';
import 'permissions.dart';

void setupDependencies() {
  Get.put<CompanyPermissions>(CompanyPermissions(), permanent: true);

  Get.put<ICompanyBusinessLogic>(CompanyBusinessLogic(), permanent: true);
  Get.put<ICompanyRepository>(CompanyRepository(), permanent: true);
  Get.put<ICompanyService>(CompanyService(), permanent: true);

  Get.lazyPut<CustomDrawerController>(() => CustomDrawerController(), fenix: true);
  Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  Get.lazyPut<CompanyFormController>(() => CompanyFormController(), fenix: true);
}

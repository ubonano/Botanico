import 'package:botanico/pages/sign_in_page/sign_in_controller.dart';
import 'package:botanico/pages/sign_up_page/sign_up_controller.dart';
import 'package:botanico/pages/profile_create_page/profile_create_controller.dart';
import 'package:botanico/pages/company/company_controller.dart';
import 'package:botanico/services/company_service.dart';
import 'package:botanico/utils/log_service.dart';
import 'package:get/get.dart';

import '../services/auth_service.dart';
import '../services/profile_service.dart';
import '../widgets/sign_out_button/sign_out_controller.dart';
import '../pages/home/home_controller.dart';
import '../pages/lobby/lobby_controller.dart';
import '../utils/async_operation_service.dart';
import '../utils/navigation_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LogService(), permanent: true);
    Get.put(NavigationService(), permanent: true);
    Get.put(AsyncOperationService(), permanent: true);
    Get.put(AuthService(), permanent: true);
    Get.put(ProfileService(), permanent: true);
    Get.put(CompanyService(), permanent: true);

    Get.lazyPut<SignInController>(() => SignInController(), fenix: true);
    Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);
    
    Get.lazyPut<ProfileCreateController>(() => ProfileCreateController(), fenix: true);
    Get.lazyPut<CompanyController>(() => CompanyController(), fenix: true);
    Get.lazyPut<LobbyController>(() => LobbyController(), fenix: true);
    Get.lazyPut<SignOutController>(() => SignOutController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}

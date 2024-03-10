import 'package:botanico/modules/auth/widgets/sign_in_page/sign_in_controller.dart';
import 'package:botanico/modules/auth/widgets/sign_up_page/sign_up_controller.dart';
import 'package:botanico/modules/auth/widgets/profile_create_page/profile_create_controller.dart';
import 'package:botanico/modules/company/company_controller.dart';
import 'package:botanico/modules/company/company_service.dart';
import 'package:botanico/services/loggin_service.dart';
import 'package:get/get.dart';

import '../modules/auth/services/auth_service.dart';
import '../modules/auth/services/profile_service.dart';
import '../modules/auth/widgets/sign_out_button/sign_out_controller.dart';
import '../modules/home/home_controller.dart';
import '../modules/lobby/lobby_controller.dart';
import '../services/async_operation_service.dart';
import '../services/navigation_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoggingService(), permanent: true);
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

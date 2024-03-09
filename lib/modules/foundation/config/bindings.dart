import 'package:botanico/modules/auth/widgets/sign_in/sign_in_controller.dart';
import 'package:botanico/modules/auth/widgets/sign_up/sign_up_controller.dart';
import 'package:botanico/modules/auth/widgets/user_create/user_create_controller.dart';
import 'package:botanico/modules/company/company_controller.dart';
import 'package:botanico/modules/company/company_service.dart';
import 'package:botanico/modules/foundation/services/loggin_service.dart';
import 'package:get/get.dart';

import '../../auth/services/auth_service.dart';
import '../../auth/services/user_service.dart';
import '../../auth/widgets/sign_out/sign_out_controller.dart';
import '../../home/home_controller.dart';
import '../../lobby/lobby_controller.dart';
import '../services/async_operation_service.dart';
import '../services/navigation_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoggingService(), permanent: true);
    Get.put(NavigationService(), permanent: true);
    Get.put(AsyncOperationService(), permanent: true);
    Get.put(AuthService(), permanent: true);
    Get.put(UserService(), permanent: true);
    Get.put(CompanyService(), permanent: true);

    Get.lazyPut<SignInController>(() => SignInController(), fenix: true);
    Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);
    
    Get.lazyPut<UserCreateController>(() => UserCreateController(), fenix: true);
    Get.lazyPut<CompanyController>(() => CompanyController(), fenix: true);
    Get.lazyPut<LobbyController>(() => LobbyController(), fenix: true);
    Get.lazyPut<SignOutController>(() => SignOutController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}

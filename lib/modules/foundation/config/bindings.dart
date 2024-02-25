import 'package:botanico/modules/auth/controllers/sign_in_controller.dart';
import 'package:botanico/modules/auth/controllers/sign_up_controller.dart';
import 'package:botanico/modules/auth/services/auth_service.dart';
import 'package:botanico/modules/auth/controllers/user_profile_controller.dart';
import 'package:botanico/modules/foundation/controllers/company_profile_controller.dart';
import 'package:botanico/modules/foundation/services/company_profile_service.dart';
import 'package:botanico/modules/foundation/utils/loggin_service.dart';
import 'package:get/get.dart';

import '../controllers/lobby_controller.dart';
import '../utils/async_operation_service.dart';
import '../utils/navigation_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoggingService());
    Get.put(NavigationService());
    Get.put(AsyncOperationService());
    Get.put(AuthService(), permanent: true);
    Get.put(CompanyProfileService(), permanent: true);

    Get.lazyPut<SignInController>(() => SignInController(), fenix: true);
    Get.lazyPut<SignUpPageController>(() => SignUpPageController(), fenix: true);
    Get.lazyPut<UserProfileController>(() => UserProfileController(), fenix: true);
    Get.lazyPut<LobbyController>(() => LobbyController(), fenix: true);
    Get.lazyPut<CompanyProfileController>(() => CompanyProfileController(), fenix: true);
  }
}

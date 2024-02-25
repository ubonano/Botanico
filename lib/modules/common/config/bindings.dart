import 'package:botanico/modules/sign_in/sign_in_controller.dart';
import 'package:botanico/modules/sign_up/sign_up_controller.dart';
import 'package:botanico/modules/common/services/auth_service.dart';
import 'package:botanico/modules/user_profile/user_profile_controller.dart';
import 'package:botanico/modules/company_profile/company_profile_controller.dart';
import 'package:botanico/modules/company_profile/company_profile_service.dart';
import 'package:botanico/modules/common/utils/loggin_service.dart';
import 'package:get/get.dart';

import '../../lobby/lobby_controller.dart';
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

import 'package:botanico/modules/auth/sign_in/sign_in_controller.dart';
import 'package:botanico/modules/auth/sign_up/sign_up_controller.dart';
import 'package:botanico/modules/auth/auth_service.dart';
import 'package:botanico/modules/user_profile/user_profile_controller.dart';
import 'package:botanico/modules/company_profile/company_profile_controller.dart';
import 'package:botanico/modules/company_profile/company_profile_service.dart';
import 'package:botanico/modules/foundation/services/loggin_service.dart';
import 'package:get/get.dart';

import '../../auth/sign_out/sign_out_controller.dart';
import '../../lobby/lobby_controller.dart';
import '../../user_profile/user_profile_service.dart';
import '../services/async_operation_service.dart';
import '../services/navigation_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoggingService(), permanent: true);
    Get.put(NavigationService(), permanent: true);
    Get.put(AsyncOperationService(), permanent: true);
    Get.put(AuthService(), permanent: true);
    Get.put(UserProfileService(), permanent: true);
    Get.put(CompanyProfileService(), permanent: true);

    Get.lazyPut<SignInController>(() => SignInController(), fenix: true);
    Get.lazyPut<SignUpPageController>(() => SignUpPageController(), fenix: true);
    Get.lazyPut<UserProfileController>(() => UserProfileController(), fenix: true);
    Get.lazyPut<CompanyProfileController>(() => CompanyProfileController(), fenix: true);
    Get.lazyPut<LobbyController>(() => LobbyController(), fenix: true);
    Get.lazyPut<SignOutController>(() => SignOutController(), fenix: true);
  }
}

import 'package:botanico/modules/auth/controllers/sign_in_controller.dart';
import 'package:botanico/modules/auth/controllers/sign_up_controller.dart';
import 'package:botanico/modules/auth/services/session_service.dart';
import 'package:botanico/modules/user_profile/controllers/user_profile_controller.dart';
import 'package:botanico/modules/foundation/services/loggin_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../modules/user_profile/services/user_profile_service.dart';
import '../modules/foundation/services/navigation_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Logger());
    Get.put(NavigationService());
    Get.put(LoggingService());

    Get.lazyPut<SessionService>(() => SessionService());
    Get.lazyPut<SignInController>(() => SignInController(), fenix: true);
    Get.lazyPut<SignUpPageController>(() => SignUpPageController(),
        fenix: true);
    Get.lazyPut<UserProfileService>(() => UserProfileService());

    Get.put(UserProfileController());
  }
}

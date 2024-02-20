import 'package:botanico/modules/user_profile/controllers/user_profile_controller.dart';
import 'package:botanico/modules/foundation/services/loggin_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../modules/auth/controllers/auth_controller.dart';
import '../modules/user_profile/services/user_profile_service.dart';
import '../modules/foundation/services/navigation_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProfileService>(() => UserProfileService());

    Get.put(Logger());
    Get.put(NavigationService());
    Get.put(LoggingService());

    Get.put(AuthController());
    Get.put(UserProfileController());
  }
}

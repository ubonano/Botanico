import 'package:botanico/auth/controllers/user_profile_controller.dart';
import 'package:botanico/services/loggin_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../auth/controllers/auth_controller.dart';
import '../auth/services/user_profile_service.dart';
import '../services/navigation_service.dart';

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

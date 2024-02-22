import 'package:botanico/modules/session/controllers/sign_in_controller.dart';
import 'package:botanico/modules/session/controllers/sign_up_controller.dart';
import 'package:botanico/modules/session/services/session_service.dart';
import 'package:botanico/modules/session/controllers/user_profile_controller.dart';
import 'package:botanico/modules/foundation/services/loggin_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../services/async_operation_service.dart';
import '../services/navigation_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Logger());
    Get.put(NavigationService());
    Get.put(LoggingService());
    Get.put(AsyncOperationService());
    Get.put(SessionService(), permanent: true);

    Get.lazyPut<SignInController>(() => SignInController(), fenix: true);
    Get.lazyPut<SignUpPageController>(() => SignUpPageController(), fenix: true);

    Get.put(UserProfileController());
  }
}

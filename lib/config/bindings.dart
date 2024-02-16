import 'package:botanico/auth/controllers/user_controller.dart';
import 'package:botanico/services/loggin_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

import '../auth/controllers/auth_controller.dart';
import '../auth/services/user_service.dart';
import '../services/navigation_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseAuth>(() => FirebaseAuth.instance);
    Get.lazyPut<GoogleSignIn>(() => GoogleSignIn());
    Get.lazyPut<Logger>(() => Logger());
    Get.lazyPut<NavigationService>(() => NavigationService());
    Get.lazyPut<LoggingService>(() => LoggingService());
    Get.lazyPut<UserService>(() => UserService());

    Get.put(AuthController());

    Get.put(UserController());
  }
}

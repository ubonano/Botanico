import 'package:botanico/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/routes.dart';
import '../controllers/user_profile_controller.dart';

class UserProfileCompletionMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final UserProfileController userProfileController = Get.find();
    final AuthController authController = Get.find();

    if (authController.isUserLoggedIn() &&
        !userProfileController.isProfileComplete) {
      return const RouteSettings(name: Routes.USER_PROFILE_FORM);
    }
    return null;
  }
}

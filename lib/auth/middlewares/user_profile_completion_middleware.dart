import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/routes.dart';
import '../controllers/user_profile_controller.dart';

class UserProfileCompletionMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final UserProfileController userProfileController = Get.find();

    if (!userProfileController.isProfileComplete) {
      return const RouteSettings(name: Routes.USER_PROFILE_FORM);
    }
    return null;
  }
}

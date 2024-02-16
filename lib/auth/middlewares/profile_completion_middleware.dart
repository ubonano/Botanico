import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/routes.dart';
import '../controllers/user_controller.dart';

class ProfileCompletionMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final UserController userController = Get.find();

    if (!userController.isProfileComplete) {
      return const RouteSettings(name: Routes.USER_PROFILE);
    }
    return null;
  }
}

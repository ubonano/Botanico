import 'package:botanico/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/routes.dart';

class UserProfileCompletionMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final AuthController authController = Get.find();

    if (authController.isUserLoggedIn() && !authController.isProfileComplete) { // TODO REVISAR que cuando se actualiza la pagina lleva siempre a completar el perfil
      return const RouteSettings(name: Routes.USER_PROFILE_FORM);
    }
    return null;
  }
}

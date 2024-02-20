import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../config/routes.dart';
import '../controllers/auth_controller.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final AuthController authController = Get.find();

    if (!authController.isUserLoggedIn()) {
      return const RouteSettings(name: Routes.LOGIN);
    }
    return null;
  }
}

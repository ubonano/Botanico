import 'package:botanico/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../config/routes.dart';

class NotAuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final AuthController authController = Get.find();

    if (authController.isUserLoggedIn()) {
      return const RouteSettings(name: Routes.HOME);
    }
    return null;
  }
}

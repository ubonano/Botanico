import 'package:botanico/modules/auth/services/session_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../config/routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final SessionService sessionService = Get.find();

    if (!sessionService.isUserLoggedIn) {
      return const RouteSettings(name: Routes.SIGN_IN);
    }
    return null;
  }
}

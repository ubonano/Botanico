import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../config/routes.dart';
import '../services/session_service.dart';

class NotAuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final SessionService sessionService = Get.find();

    if (sessionService.isUserLoggedIn) {
      return const RouteSettings(name: Routes.HOME);
    }
    return null;
  }
}

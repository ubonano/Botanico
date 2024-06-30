import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/ui/ui.dart';
import '../setup/interfaces/i_authentication_service.dart';
import 'ui.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    late final IAuthenticationService authService = Get.find();
    if (authService.currentUser == null) {
      return const RouteSettings(name: SignInPage.route);
    }
    return null;
  }
}

class NoAuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    late final IAuthenticationService authService = Get.find();
    if (authService.currentUser != null) {
      return const RouteSettings(name: HomePage.route);
    }
    return null;
  }
}

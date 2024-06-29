import 'package:botanico/modules/authentication/content/setup/interfaces/i_authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/ui/navigation.dart';
import '../../ui/navigation.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    late final IAuthenticationService authService = Get.find();
    if (authService.currentUser == null) {
      return const RouteSettings(name: AuthenticationNavigate.SIGN_IN);
    }
    return null;
  }
}

class NoAuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    late final IAuthenticationService authService = Get.find();
    if (authService.currentUser != null) {
      return const RouteSettings(name: AppNavigation.HOME);
    }
    return null;
  }
}

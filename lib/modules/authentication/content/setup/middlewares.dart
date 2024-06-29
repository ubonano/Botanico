import 'package:botanico/modules/authentication/content/setup/interfaces/i_authentication_service.dart';
import 'package:botanico/modules/company/content/setup/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'navigation.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    late final IAuthenticationService authService = Get.find<IAuthenticationService>();
    if (authService.currentUser == null) {
      return const RouteSettings(name: AuthenticationNavigate.SIGN_IN);
    }
    return null;
  }
}

class NoAuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    late final IAuthenticationService authService = Get.find<IAuthenticationService>();
    if (authService.currentUser != null) {
      return const RouteSettings(name: CompanyNavigation.HOME);
    }
    return null;
  }
}

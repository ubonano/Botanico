import 'package:botanico/auth/pages/user_profile_page.dart';
import 'package:get/get.dart';

import '../auth/middlewares/auth_middleware.dart';
import '../auth/middlewares/not_auth_middleware.dart';
import '../auth/pages/login_page.dart';
import '../auth/pages/sign_up_page.dart';
import '../pages/home_page.dart';
import 'routes.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      middlewares: [
        NotAuthMiddleware(),
      ],
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => const SignUpPage(),
      middlewares: [
        NotAuthMiddleware(),
      ],
    ),
    GetPage(
      name: Routes.USER_PROFILE,
      page: () => UserProfilePage(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
  ];
}

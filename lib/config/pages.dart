import 'package:botanico/modules/user_profile/pages/user_profile_page.dart';
import 'package:get/get.dart';

import '../modules/auth/middlewares/auth_middleware.dart';
import '../modules/auth/middlewares/not_auth_middleware.dart';
import '../modules/auth/pages/login_page.dart';
import '../modules/auth/pages/sign_up_page.dart';
import '../modules/foundation/pages/home_page.dart';
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

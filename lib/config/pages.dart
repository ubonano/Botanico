import 'package:botanico/auth/middlewares/profile_completion_middleware.dart';
import 'package:botanico/auth/pages/user_page.dart';
import 'package:get/get.dart';

import '../auth/middlewares/auth_middleware.dart';
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
        ProfileCompletionMiddleware(),
      ],
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => const SignUpPage(),
    ),
    GetPage(
      name: Routes.USER_PROFILE,
      page: () => const UserPage(),
    ),
  ];
}

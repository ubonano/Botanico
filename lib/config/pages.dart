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
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => const SignUpPage(),
    ),
  ];
}

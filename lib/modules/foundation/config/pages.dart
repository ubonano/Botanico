import 'package:botanico/modules/session/middlewares/auth_state_middleware.dart';
import 'package:botanico/modules/session/pages/user_profile_page.dart';
import 'package:get/get.dart';

import '../../session/pages/sign_in_page.dart';
import '../../session/pages/sign_up_page.dart';
import '../pages/home_page.dart';
import 'routes.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      middlewares: [
        AuthStateMiddleware(),
      ],
    ),
    GetPage(
      name: Routes.SIGN_IN,
      page: () => SignInPage(),
      middlewares: [
        AuthStateMiddleware(),
      ],
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => SignUpPage(),
      middlewares: [
        AuthStateMiddleware(),
      ],
    ),
    GetPage(
      name: Routes.USER_PROFILE,
      page: () => UserProfilePage(),
      middlewares: [
        AuthStateMiddleware(),
      ],
    ),
  ];
}

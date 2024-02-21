import 'package:botanico/modules/auth/middlewares/auth_state_middleware.dart';
import 'package:botanico/modules/user_profile/pages/user_profile_page.dart';
import 'package:get/get.dart';

import '../modules/auth/pages/sign_in_page.dart';
import '../modules/auth/pages/sign_up_page.dart';
import '../modules/foundation/pages/home_page.dart';
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

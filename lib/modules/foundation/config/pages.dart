import 'package:botanico/modules/auth/middlewares/auth_state_middleware.dart';
import 'package:botanico/modules/auth/pages/user_profile_page.dart';
import 'package:get/get.dart';

import '../../auth/pages/sign_in_page.dart';
import '../../auth/pages/sign_up_page.dart';
import '../pages/company_profile_page.dart';
import '../pages/lobby_page.dart';
import 'routes.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.LOBBY,
      page: () => const LobbyPage(),
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
    GetPage(
      name: Routes.COMPANY_PROFILE,
      page: () => const CompanyProfilePage(),
      middlewares: [
        AuthStateMiddleware(),
      ],
    ),
  ];
}

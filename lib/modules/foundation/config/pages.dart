import 'package:botanico/modules/foundation/middlewares/auth_state_middleware.dart';
import 'package:botanico/modules/user_profile/user_profile_page.dart';
import 'package:get/get.dart';

import '../../sign_in/sign_in_page.dart';
import '../../sign_up/sign_up_page.dart';
import '../../company_profile/company_profile_page.dart';
import '../../home/home_page.dart';
import '../../lobby/lobby_page.dart';
import 'routes.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      middlewares: [
        AuthStateMiddleware(),
      ],
    ),
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

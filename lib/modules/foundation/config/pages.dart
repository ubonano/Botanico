import 'package:botanico/modules/user/user_page.dart';
import 'package:get/get.dart';
import '../../user/sign_in/sign_in_page.dart';
import '../../user/sign_up/sign_up_page.dart';
import '../../company/company_page.dart';
import '../../home/home_page.dart';
import '../../lobby/lobby_page.dart';
import 'routes.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.LOBBY,
      page: () => const LobbyPage(),
    ),
    GetPage(
      name: Routes.SIGN_IN,
      page: () => const SignInPage(),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => const SignUpPage(),
    ),
    GetPage(
      name: Routes.USER_PROFILE,
      page: () => const UserPage(),
    ),
    GetPage(
      name: Routes.COMPANY_PROFILE,
      page: () => const CompanyPage(),
    ),
  ];
}

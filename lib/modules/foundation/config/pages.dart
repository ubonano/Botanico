import 'package:botanico/modules/auth/widgets/user_create/user_create_page.dart';
import 'package:get/get.dart';
import '../../auth/widgets/sign_in/sign_in_page.dart';
import '../../auth/widgets/sign_up/sign_up_page.dart';
import '../../company/company_page.dart';
import '../../home/home_page.dart';
import '../../lobby/lobby_page.dart';
import 'routes.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.SIGN_IN,
      page: () => const SignInPage(),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => const SignUpPage(),
    ),
    GetPage(
      name: Routes.USER_CREATE,
      page: () => const UserCreatePage(),
    ),
    GetPage(
      name: Routes.LOBBY,
      page: () => const LobbyPage(),
    ),
    GetPage(
      name: Routes.COMPANY,
      page: () => const CompanyPage(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
    ),
  ];
}

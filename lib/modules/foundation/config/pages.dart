import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/company/company_module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/worker/worker_module.dart';
import 'package:get/get.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.EMPTY,
      page: () => const HomePage(),
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
      name: Routes.WORKER_CREATE,
      page: () => const WorkerCreatePage(),
    ),
    GetPage(
      name: Routes.LOBBY,
      page: () => const LobbyPage(),
    ),
    GetPage(
      name: Routes.COMPANY_CREATE,
      page: () => const CompanyCreatePage(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.WORKER_LIST,
      page: () => const WorkerListPage(),
    ),
    GetPage(
      name: Routes.WORKER_LINKING,
      page: () => const WorkerLinkingPage(),
    ),
    GetPage(
      name: Routes.WORKER_MANAGEMENT_PERMISSIONS,
      page: () => const WorkerManagementPage(),
    ),
  ];
}

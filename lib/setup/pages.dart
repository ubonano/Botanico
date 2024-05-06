import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/company/module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:get/get.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.EMPTY,
      page: () => const HomePage(),
    ),
    GetPage(
      name: CompanyNavigationHelper.COMPANY_CREATE,
      page: () => const CompanyCreatePage(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AuthenticationNavigationHelper.SIGN_IN,
      page: () => const SignInPage(),
    ),
    GetPage(
      name: AuthenticationNavigationHelper.SIGN_UP,
      page: () => const SignUpPage(),
    ),
    GetPage(
      name: WorkerNavigationHelper.WORKER_CREATE,
      page: () => const WorkerCreatePage(),
    ),
    GetPage(
      name: WorkerNavigationHelper.WORKER_LIST,
      page: () => const WorkerListPage(),
    ),
    GetPage(
      name: WorkerNavigationHelper.WORKER_LINKING,
      page: () => const WorkerLinkPage(),
    ),
    GetPage(
      name: WorkerNavigationHelper.WORKER_PERMISSIONS,
      page: () => const ModuleListPage(),
    ),
    GetPage(
      name: WorkerNavigationHelper.LOBBY,
      page: () => const LobbyPage(),
    ),
  ];
}

import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:botanico/ui/custom_ui.dart';
import 'package:get/get.dart';

import '../modules/company/ui/company_create_page.dart';

import 'routes.dart';

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
      name: Routes.LINKED_WORKERS,
      page: () => const LinkedWorkersPage(),
    ),
    GetPage(
      name: Routes.LINK_WORKER,
      page: () => const LinkWorkerPage(),
    ),
    GetPage(
      name: Routes.WORKER_MANAGEMENT_PERMISSIONS,
      page: () => const WorkerManagementPage(),
    ),
  ];
}

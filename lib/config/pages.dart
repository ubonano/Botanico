import 'package:botanico/modules/worker/ui/worker_create/worker_create_page.dart';
import 'package:get/get.dart';
import '../modules/worker/ui/link_worker/link_worker_page.dart';
import '../modules/authentication/ui/sign_in/sign_in_page.dart';
import '../modules/authentication/ui/sign_up/sign_up_page.dart';
import '../modules/company/ui/company_create/company_create_page.dart';
import '../ui/home/home_page.dart';
import '../modules/worker/ui/lobby/lobby_page.dart';
import '../modules/worker/ui/linked_workers/linked_workers_page.dart';
import '../modules/worker/ui/worker_management_permissions/worker_management_permissions_screen.dart';
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
      page: () => const WorkerManagementScreen(),
    ),
  ];
}

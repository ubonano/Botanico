import 'package:botanico/pages/worker_create/worker_create_page.dart';
import 'package:get/get.dart';
import '../pages/link_worker/link_worker_page.dart';
import '../pages/sign_in/sign_in_page.dart';
import '../pages/sign_up/sign_up_page.dart';
import '../pages/company_create/company_create_page.dart';
import '../pages/home/home_page.dart';
import '../pages/lobby/lobby_page.dart';
import '../pages/linked_workers/linked_workers_page.dart';
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
  ];
}

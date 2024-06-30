// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../../authentication/ui/middlewares.dart';
import 'ui.dart';
import 'middlewares.dart';

mixin WorkerNavigation {
  static const WORKER_CREATE = '/worker-create';
  static const WORKER_LIST = '/worker-list';
  static const WORKER_LINKING = '/worker-linking';
  static const WORKER_PERMISSIONS = '/worker-permissions';
  static const LOBBY = '/lobby';

  void toWorkerCreate({bool canPop = false}) => to(WORKER_CREATE, canPop: canPop);
  void toWorkerList({bool canPop = false}) => to(WORKER_LIST, canPop: canPop);
  void toLinkingWorker({bool canPop = false}) => to(WORKER_LINKING, canPop: canPop);
  void toPermissions(String workerUid, {bool canPop = false}) =>
      to(WORKER_PERMISSIONS, arguments: workerUid, canPop: canPop);
  void toLobby({bool canPop = false}) => to(LOBBY, canPop: canPop);

  void to(String route, {dynamic arguments, bool canPop = false});
}

final pages = [
  GetPage(
    name: WorkerNavigation.LOBBY,
    page: () => const LobbyPage(),
    middlewares: [
      AuthMiddleware(),
      HasWorkerMiddleware(),
      IsNotEmployedOrOwnerMiddleware(),
    ],
  ),
  GetPage(
    name: WorkerNavigation.WORKER_CREATE,
    page: () => const WorkerFormPage(),
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: WorkerNavigation.WORKER_LIST,
    page: () => const WorkerListPage(),
    middlewares: [
      AuthMiddleware(),
      HasWorkerMiddleware(),
      IsEmployedOrOwnerMiddleware(),
    ],
  ),
  GetPage(
    name: WorkerNavigation.WORKER_LINKING,
    page: () => const WorkerLinkPage(),
    middlewares: [
      AuthMiddleware(),
      HasWorkerMiddleware(),
      IsEmployedOrOwnerMiddleware(),
    ],
  ),
  GetPage(
    name: WorkerNavigation.WORKER_PERMISSIONS,
    page: () => const WorkerPermissionManagementPage(),
    middlewares: [
      AuthMiddleware(),
      HasWorkerMiddleware(),
      IsEmployedOrOwnerMiddleware(),
    ],
  ),
];

// ignore_for_file: constant_identifier_names

mixin WorkerNavigationHelper {
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

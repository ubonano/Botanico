import '../../../module.dart';

abstract class IWorkerService {
  WorkerModel? get curWorkerForUpdate$;
  WorkerModel? get loggedWorker$;
  List<WorkerModel> get linkedWorkerList$;

  Future<WorkerModel?> fetchCurWorkerForUpdate();
  Future<WorkerModel?> fetchLoggedWorker();
  void clearCurrentWorker();
  Future<void> create(WorkerModel worker);
  Future<void> link(String workerId);
  Future<void> unlink(String workerId);
  Future<void> initializeLinkedWorkerStream();
  void cancelLinkedWorkerStream();
  Future<void> togglePermissionCurWorkerForUpdate(String permissionId);
}

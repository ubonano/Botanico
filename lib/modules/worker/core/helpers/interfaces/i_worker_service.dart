import '../../../module.dart';

abstract class IWorkerService {
  WorkerModel? get curWorkerForUpdate$;
  WorkerModel? get loggedWorker$;
  List<WorkerModel> get linkedWorkerList$;

  Future<WorkerModel?> fetchCurWorkerForUpdate();
  Future<WorkerModel?> fetchLoggedWorker();
  void clearCurrentWorker();
  Future<void> createWorker(WorkerModel worker);
  Future<void> linkWorker(String workerId);
  Future<void> unlinkWorker(String workerId);
  Future<void> initializeLinkedWorkerStream();
  void cancelLinkedWorkerStream();
  Future<void> togglePermissionCurWorkerForUpdate(String permissionId);
}

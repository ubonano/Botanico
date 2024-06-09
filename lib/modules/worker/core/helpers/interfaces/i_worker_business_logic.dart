import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../worker_model.dart';

abstract class IWorkerBusinessLogic {
  WorkerModel? get loggedWorker$;
  WorkerModel? get curWorkerForUpdate$;
  RxList<WorkerModel> get linkedWorkerList$;
  dynamic get workerIdParmForUpdate;

  Future<WorkerModel?> fetchLoggedWorker();
  Future<WorkerModel?> fetchCurWorkerForUpdate();
  Future<WorkerModel?> get(String id);
  Future<void> updateWorkerAsOwner(String companyId, Transaction? txn);
  Future<void> create(WorkerModel worker);
  Future<void> link(String workerId, Transaction? txn);
  Future<void> unlink(String workerId, Transaction? txn);
  Future<void> initializeLinkedWorkerStream();
  void cancelLinkedWorkerStream();
  Future<void> togglePermissionCurWorkerForUpdate(String permissionId);
  void clearCurrentWorker();
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../models/worker_model.dart';

abstract class IWorkerBusinessLogic {
  WorkerModel? get loggedWorker$;
  WorkerModel? get curWorkerForUpdate$;
  RxList<WorkerModel> get linkedWorkerList$;
  dynamic get workerIdParmForUpdate;

  Future<WorkerModel?> fetchLoggedWorker();
  Future<WorkerModel?> fetchCurWorkerForUpdate();
  Future<WorkerModel?> get(String id);
  Future<void> updateWorkerAsOwner(String companyId, Transaction? txn);
  Future<void> createWorker(WorkerModel worker);
  Future<void> postCreateWorker();
  Future<void> linkWorker(String workerId, Transaction? txn);
  Future<void> postLinkWorker();
  Future<void> unlinkWorker(String workerId, Transaction? txn);
  Future<void> initializeLinkedWorkerStream();
  void cancelLinkedWorkerStream();
  Future<void> togglePermissionCurWorkerForUpdate(String permissionId);
  void clearCurrentWorker();
}

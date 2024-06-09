import 'dart:async';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../worker_model.dart';

abstract class IWorkerBusinessLogic {
  WorkerModel? get loggedWorker$;
  WorkerModel? get curWorkerForUpdate$;
  dynamic get workerIdParmForUpdate;

  Future<WorkerModel?> fetchLoggedWorker();
  void clearLoggedWorker();
  Future<WorkerModel?> fetchCurWorkerForUpdate();
  Future<WorkerModel?> get(String id);
  Future<void> updateWorkerAsOwner(String companyId, Transaction? txn);
  Future<void> create(WorkerModel worker);
  Future<void> link(String workerId, Transaction? txn);
  Future<void> unlink(String workerId, Transaction? txn);
  StreamSubscription<List<WorkerModel>>? initializeStream({
    required RxList<WorkerModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    Function(List<WorkerModel>)? onNewData,
  });
  Future<void> togglePermissionCurWorkerForUpdate(String permissionId);
}

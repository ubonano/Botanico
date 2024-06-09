import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../module.dart';

abstract class IWorkerService {
  WorkerModel? get curWorkerForUpdate$;
  WorkerModel? get loggedWorker$;

  Future<WorkerModel?> fetchCurWorkerForUpdate();
  Future<WorkerModel?> fetchLoggedWorker();
  void clearCurrentWorker();
  Future<void> create(WorkerModel worker);
  Future<void> link(String workerId);
  Future<void> unlink(String workerId);
  Future<void> togglePermissionCurWorkerForUpdate(String permissionId);
  StreamSubscription<List<WorkerModel>>? initializeStream({
    required RxList<WorkerModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    Function(List<WorkerModel>)? onNewData,
  });
}

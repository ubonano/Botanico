import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../model/worker_model.dart';
export '../../model/worker_model.dart';

abstract class IWorkerService {
  WorkerModel? get currentWorker$;

  Future<WorkerModel?> fetchCurrentWorker();
  void clearCurrentWorker();
  Future<WorkerModel?> get(String id);
  Future<void> create(WorkerModel worker);
  Future<void> update(WorkerModel worker);
  Future<void> link(String workerId);
  Future<void> unlink(String workerId);
  StreamSubscription<List<WorkerModel>>? initStream({
    required RxList<WorkerModel> list$,
    DocumentSnapshot? startAfter,
    int limit = 20,
    Function(List<WorkerModel>)? onNewData,
  });
}

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/worker_model.dart';
export '../../model/worker_model.dart';

abstract class ILinkedWorkerRepository {
  Future<void> link(WorkerModel worker, {Transaction? txn});
  Future<void> unlink(String id, {Transaction? txn});
  Stream<List<WorkerModel>> initStream({DocumentSnapshot? startAfter, int limit = 20});
}

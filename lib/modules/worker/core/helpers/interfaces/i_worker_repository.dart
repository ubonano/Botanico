import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../module.dart';

abstract class IWorkerRepository {
  Future<WorkerModel?> get(String id);
  Future<void> create(WorkerModel worker, {Transaction? txn});
  Future<void> link(WorkerModel worker, {Transaction? txn});
  Future<void> update(WorkerModel worker, {Transaction? txn});
  Future<void> updatePartial(String workerId, Map<String, dynamic> changes, {Transaction? txn});
  Future<void> unlink(String workerId, {Transaction? txn});
  Stream<List<WorkerModel>> initializeStream({DocumentSnapshot? startAfter, int limit = 20});
}

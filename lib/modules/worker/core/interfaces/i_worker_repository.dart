import 'package:cloud_firestore/cloud_firestore.dart';

import '../../module.dart';

abstract class IWorkerRepository {
  Future<WorkerModel?> get(String id);
  Future<void> create(WorkerModel worker, {Transaction? txn});
  Future<void> update(WorkerModel worker, {Transaction? txn});
  Future<void> updatePartial(String id, Map<String, dynamic> changes, {Transaction? txn});
}

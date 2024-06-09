import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../module.dart';

abstract class ILinkedWorkerRepository {
  Future<void> link(WorkerModel worker, {Transaction? txn});
  Future<void> unlink(String id, {Transaction? txn});
  Stream<List<WorkerModel>> initializeStream({DocumentSnapshot? startAfter, int limit = 20});
}

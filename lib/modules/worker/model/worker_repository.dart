import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../setup/interfaces/i_worker_repository.dart';

class WorkerRepository implements IWorkerRepository {
  late final FirebaseFirestore _firestore = Get.find();

  @override
  Future<WorkerModel?> get(String id) async {
    if (id.isEmpty) return null;
    final docSnapshot = await _workerRef.doc(id).get();
    return docSnapshot.exists ? WorkerModel.fromSnapshot(docSnapshot) : null;
  }

  @override
  Future<void> create(WorkerModel worker, {Transaction? txn}) async {
    final docRef = _workerRef.doc(worker.uid);
    txn != null ? txn.set(docRef, worker.toMap()) : await docRef.set(worker.toMap());
  }

  @override
  Future<void> update(WorkerModel worker, {Transaction? txn}) async {
    final docRef = _workerRef.doc(worker.uid);
    txn != null ? txn.update(docRef, worker.toMap()) : await docRef.update(worker.toMap());
  }

  @override
  Future<void> updatePartial(String id, Map<String, dynamic> changes, {Transaction? txn}) async {
    final docRef = _workerRef.doc(id);
    txn != null ? txn.update(docRef, changes) : await docRef.update(changes);
  }

  CollectionReference<Map<String, dynamic>> get _workerRef => _firestore.collection(WorkerModel.collectionName);
}

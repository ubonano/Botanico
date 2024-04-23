import 'package:botanico/modules/foundation/aux/firestore_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../worker_module.dart';

class WorkerRepository {
  late final FirebaseFirestore _firestore = Get.find();

  final Rx<WorkerModel?> _currentWorker = Rx<WorkerModel?>(null);

  WorkerModel? get currentWorker$ => _currentWorker.value;

  Future<WorkerModel?> fetch(String id) async {
    _currentWorker.value ??= await get(id);
    return _currentWorker.value;
  }

  Future<WorkerModel?> get(String id) async {
    if (id.isEmpty) return null;
    final docSnapshot = await _workerRef.doc(id).get();
    return docSnapshot.exists ? WorkerModel.fromSnapshot(docSnapshot) : null;
  }

  Future<void> createWorker(WorkerModel worker, {Transaction? txn}) async {
    final docRef = _workerRef.doc(worker.uid);
    txn != null ? txn.set(docRef, worker.toMap()) : await docRef.set(worker.toMap());
  }

  Future<void> createLinkedWorker(String companyId, WorkerModel worker, {Transaction? txn}) async {
    final docRef = _linkedWorkersRef(companyId).doc(worker.uid);
    txn != null ? txn.set(docRef, worker.toLinkedWorkerMap()) : await docRef.set(worker.toLinkedWorkerMap());
  }

  Future<void> updateWorker(WorkerModel worker, {Transaction? txn}) async {
    final docRef = _workerRef.doc(worker.uid);
    txn != null ? txn.update(docRef, worker.toMap()) : await docRef.update(worker.toMap());
  }

  Future<void> updatePartialWorker(String workerId, Map<String, dynamic> changes, {Transaction? txn}) async {
    final docRef = _workerRef.doc(workerId);
    txn != null ? txn.update(docRef, changes) : await docRef.update(changes);
  }

  Future<void> deleteLinkedWorker(String companyId, String workerId, {Transaction? txn}) async {
    final docRef = _linkedWorkersRef(companyId).doc(workerId);
    txn != null ? txn.delete(docRef) : await docRef.delete();
  }

  Stream<List<WorkerModel>> linkedWorkersStream(String companyId) {
    return _linkedWorkersRef(companyId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map(WorkerModel.fromSnapshot).toList());
  }

  CollectionReference<Map<String, dynamic>> get _workerRef => _firestore.collection(FirestoreCollections.workers);
  CollectionReference<Map<String, dynamic>> _linkedWorkersRef(String companyId) =>
      _firestore.collection(FirestoreCollections.companies).doc(companyId).collection(FirestoreCollections.workers);

  void clearCurrentWorker() => _currentWorker.value = null;
}

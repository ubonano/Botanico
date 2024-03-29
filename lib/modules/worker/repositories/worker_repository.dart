import 'package:botanico/auxiliaries/firestore_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../module.dart';

class WorkerRepository {
  final FirebaseFirestore _firestore = Get.find();

  Future<WorkerModel?> get(String id) async {
    if (id.isEmpty) return null;
    final docSnapshot = await _workerRef.doc(id).get();
    return docSnapshot.exists ? WorkerModel.fromSnapshot(docSnapshot) : null;
  }

  Future<void> create(WorkerModel worker, {Transaction? txn}) async {
    final docRef = _workerRef.doc(worker.uid);
    txn != null ? txn.set(docRef, worker.toMap()) : await docRef.set(worker.toMap());
  }

  Future<void> update(WorkerModel worker, {Transaction? txn}) async {
    final docRef = _workerRef.doc(worker.uid);
    txn != null ? txn.update(docRef, worker.toMap()) : await docRef.update(worker.toMap());
  }

  Future<void> updatePartial(String workerId, Map<String, dynamic> changes, {Transaction? txn}) async {
    final docRef = _workerRef.doc(workerId);
    txn != null ? txn.update(docRef, changes) : await docRef.update(changes);
  }

  Future<void> link(String companyId, WorkerModel worker, {Transaction? txn}) async {
    final docRef = _linkedWorkersRef(companyId).doc(worker.uid);
    txn != null ? txn.set(docRef, worker.toLinkedWorkerMap()) : await docRef.set(worker.toLinkedWorkerMap());
  }

  Future<void> unlink(String companyId, String workerId, {Transaction? txn}) async {
    final docRef = _linkedWorkersRef(companyId).doc(workerId);
    txn != null ? txn.delete(docRef) : await docRef.delete();
  }

  Future<List<WorkerModel>> getAllLinkedWorkers(String companyId) async {
    final querySnapshot = await _linkedWorkersRef(companyId).get();
    return querySnapshot.docs.map(WorkerModel.fromSnapshot).toList();
  }

  CollectionReference<Map<String, dynamic>> get _workerRef => _firestore.collection(FirestoreCollections.workers);
  CollectionReference<Map<String, dynamic>> _linkedWorkersRef(String companyId) =>
      _firestore.collection(FirestoreCollections.companies).doc(companyId).collection(FirestoreCollections.workers);
}

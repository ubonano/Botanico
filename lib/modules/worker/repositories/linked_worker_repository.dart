import 'package:botanico/auxiliaries/firestore_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/linked_worker_model.dart';

class LinkedWorkerRepository {
  late final FirebaseFirestore _firestore = Get.find();

  Future<List<LinkedWorkerModel>> getAll(String companyId) async {
    final querySnapshot = await _linkedWorkersRef(companyId).get();
    return querySnapshot.docs.map(LinkedWorkerModel.fromSnapshot).toList();
  }

  Future<LinkedWorkerModel?> get(String companyId, String workerId) async {
    final docSnapshot = await _linkedWorkersRef(companyId).doc(workerId).get();
    return docSnapshot.exists ? LinkedWorkerModel.fromSnapshot(docSnapshot) : null;
  }

  Future<void> create(String companyId, LinkedWorkerModel linkedWorker, {Transaction? txn}) async {
    final docRef = _linkedWorkersRef(companyId).doc(linkedWorker.uid);
    txn != null ? txn.set(docRef, linkedWorker.toMap()) : await docRef.set(linkedWorker.toMap());
  }

  Future<void> update(String companyId, LinkedWorkerModel linkedWorker, {Transaction? txn}) async {
    final docRef = _linkedWorkersRef(companyId).doc(linkedWorker.uid);
    txn != null ? txn.update(docRef, linkedWorker.toMap()) : await docRef.update(linkedWorker.toMap());
  }

  Future<void> delete(String companyId, String workerId, {Transaction? txn}) async {
    final docRef = _linkedWorkersRef(companyId).doc(workerId);
    txn != null ? txn.delete(docRef) : await docRef.delete();
  }

  CollectionReference<Map<String, dynamic>> _linkedWorkersRef(String companyId) => _firestore
      .collection(FirestoreCollections.companies)
      .doc(companyId)
      .collection(FirestoreCollections.linkedWorkers);
}

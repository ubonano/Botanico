import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:botanico/setup/firestore_collections.dart';
import 'package:botanico/modules/company/module.dart';

import '../module.dart';

class WorkerRepository implements IWorkerRepository {
  late final FirebaseFirestore _firestore = Get.find();

  String get _companyId => Get.find<ICompanyBusinessLogic>().currentCompany$!.uid;

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
  Future<void> link(WorkerModel worker, {Transaction? txn}) async {
    final docRef = _linkedWorkersRef().doc(worker.uid);
    txn != null ? txn.set(docRef, worker.toLinkedWorkerMap()) : await docRef.set(worker.toLinkedWorkerMap());
  }

  @override
  Future<void> update(WorkerModel worker, {Transaction? txn}) async {
    final docRef = _workerRef.doc(worker.uid);
    txn != null ? txn.update(docRef, worker.toMap()) : await docRef.update(worker.toMap());
  }

  @override
  Future<void> updatePartial(String workerId, Map<String, dynamic> changes, {Transaction? txn}) async {
    final docRef = _workerRef.doc(workerId);
    txn != null ? txn.update(docRef, changes) : await docRef.update(changes);
  }

  @override
  Future<void> unlink(String workerId, {Transaction? txn}) async {
    final docRef = _linkedWorkersRef().doc(workerId);
    txn != null ? txn.delete(docRef) : await docRef.delete();
  }

  @override
  Stream<List<WorkerModel>> initializeStream({DocumentSnapshot? startAfter, int limit = 20}) {
    var query = _linkedWorkersRef().limit(limit);

    if (startAfter != null) {
      query = query.startAfterDocument(startAfter);
    }

    return query.snapshots().map((snapshot) => snapshot.docs.map(WorkerModel.fromSnapshot).toList());
  }

  CollectionReference<Map<String, dynamic>> get _workerRef => _firestore.collection(FirestoreCollections.workers);
  CollectionReference<Map<String, dynamic>> _linkedWorkersRef() =>
      _firestore.collection(FirestoreCollections.companies).doc(_companyId).collection(FirestoreCollections.workers);
}

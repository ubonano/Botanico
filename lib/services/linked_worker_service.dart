import 'package:botanico/config/firestore_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/linked_worker_model.dart';
import '../utils/custom_service.dart';

class LinkedWorkerService extends GetxService with CustomService {
  @override
  String get logTag => 'LinkedWorkerService';

  final _companiesRef = FirebaseFirestore.instance.collection(FirestoreCollections.companies);
  final list$ = RxList<LinkedWorkerModel>();

  void clean() => list$.clear();
  void removeFromLocal(LinkedWorkerModel linkedWorker) => list$.removeWhere((lw) => lw.uid == linkedWorker.uid);

  Future<void> fetchAll(String companyId) async {
    final snapshot = await _linkedWorkersRef(companyId).get();
    list$.assignAll(snapshot.docs.map(LinkedWorkerModel.fromSnapshot).toList());
  }

  Future<LinkedWorkerModel> create(String companyId, LinkedWorkerModel linkedWorker, {Transaction? txn}) async {
    final docRef = _getDocumentReference(companyId, linkedWorker.uid);
    txn != null ? txn.set(docRef, linkedWorker.toMap()) : await docRef.set(linkedWorker.toMap());
    return linkedWorker;
  }

  Future<void> delete(String companyId, String workerId, {Transaction? txn}) async {
    final docRef = _getDocumentReference(companyId, workerId);
    txn != null ? txn.delete(docRef) : await docRef.delete();
  }

  DocumentReference _getDocumentReference(String companyId, String docId) => _linkedWorkersRef(companyId).doc(docId);

  CollectionReference<Map<String, dynamic>> _linkedWorkersRef(String companyId) {
    return _companiesRef.doc(companyId).collection(FirestoreCollections.linkedWorkers);
  }
}

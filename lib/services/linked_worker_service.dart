import 'package:botanico/config/firestore_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/linked_worker_model.dart';
import '../utils/custom_service.dart';

class LinkedWorkerService extends GetxService with CustomService {
  @override
  String get logTag => 'LinkedWorkerService';

  final _companiesRef = FirebaseFirestore.instance.collection(FirestoreCollections.companies);

  final linkedWorkers$ = RxList<LinkedWorkerModel>();

  CollectionReference<Map<String, dynamic>> _linkedWorkersRef(String companyId) =>
      _companiesRef.doc(companyId).collection(FirestoreCollections.linkedWorkers);

  Future<LinkedWorkerModel> create(String companyId, LinkedWorkerModel linkedWorker, {Transaction? txn}) async {
    DocumentReference docRef = _linkedWorkersRef(companyId).doc(linkedWorker.uid);

    if (txn != null) {
      txn.set(docRef, linkedWorker.toMap());
    } else {
      await docRef.set(linkedWorker.toMap());
    }

    return linkedWorker;
  }

  Future<void> fetchAll(String companyId) async {
    QuerySnapshot snapshot = await _linkedWorkersRef(companyId).get();

    linkedWorkers$.assignAll(snapshot.docs.map((doc) => LinkedWorkerModel.fromSnapshot(doc)).toList());
  }

  Future<void> delete(String companyId, String workerId, {Transaction? txn}) async {
    DocumentReference docRef = _linkedWorkersRef(companyId).doc(workerId);

    if (txn != null) {
      txn.delete(docRef);
    } else {
      await docRef.delete();
    }
  }

  void removeLinkedWorkerFromLocal(LinkedWorkerModel linkedWorker) =>
      linkedWorkers$.removeWhere((lw) => lw.uid == linkedWorker.uid);

  void clean() => linkedWorkers$.clear();
}

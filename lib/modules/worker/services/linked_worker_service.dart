import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class LinkedWorkerService extends GetxService with LifeCycleLogService {
  @override
  String get logTag => 'LinkedWorkerService';

  final FirebaseFirestore _firestore = Get.find();
  late final CollectionReference _companiesRef = _firestore.collection(FirestoreCollections.companies);

  final list$ = RxList<LinkedWorkerModel>();

  void clean() => list$.clear();

  void removeFromLocal(LinkedWorkerModel linkedWorker) => list$.removeWhere((lw) => lw.uid == linkedWorker.uid);

  Future<void> fetchAll(String companyId) async {
    final snapshot = await _linkedWorkersRef(companyId).get();
    list$.assignAll(snapshot.docs.map(LinkedWorkerModel.fromSnapshot).toList());
  }

  Future<bool> isWorkerAlreadyLinked(String companyId, WorkerModel worker) async =>
      (await get(companyId, worker.uid)) != null;

  Future<LinkedWorkerModel?> get(String companyId, String workerId) async {
    final docSnapshot = await _getDocumentReference(companyId, workerId).get();
    return docSnapshot.exists ? LinkedWorkerModel.fromSnapshot(docSnapshot) : null;
  }

  Future<void> linkWorkerToCompany(WorkerModel worker, String companyId,
      {WorkerRole role = WorkerRole.undefined, Transaction? txn}) async {
    final linkedWorker = LinkedWorkerModel.fromWorkerModel(worker, role);
    await create(companyId, linkedWorker, txn: txn);
  }

  Future<void> create(String companyId, LinkedWorkerModel linkedWorker, {Transaction? txn}) async {
    final docRef = _getDocumentReference(companyId, linkedWorker.uid);
    txn != null ? txn.set(docRef, linkedWorker.toMap()) : await docRef.set(linkedWorker.toMap());
  }

  Future<void> delete(String companyId, String workerId, {Transaction? txn}) async {
    final docRef = _getDocumentReference(companyId, workerId);
    txn != null ? txn.delete(docRef) : await docRef.delete();
  }

  DocumentReference _getDocumentReference(String companyId, String docId) => _linkedWorkersRef(companyId).doc(docId);

  CollectionReference<Map<String, dynamic>> _linkedWorkersRef(String companyId) =>
      _companiesRef.doc(companyId).collection(FirestoreCollections.linkedWorkers);
}

import 'package:botanico/config/firestore_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/enums/worker_role.dart';
import '../models/linked_worker_model.dart';
import '../models/worker_model.dart';
import '../utils/custom_service.dart';

/// Manages operations related to linked workers in Firestore.
///
/// Provides functionalities to fetch, create, and delete linked workers,
/// allowing manipulation of the linked workers subcollection within a company document.
class LinkedWorkerService extends GetxService with CustomService {
  @override
  String get logTag => 'LinkedWorkerService';

  /// Reference to the companies collection in Firestore.
  final _companiesRef = FirebaseFirestore.instance.collection(FirestoreCollections.companies);

  /// Observable list of [LinkedWorkerModel]s.
  final list$ = RxList<LinkedWorkerModel>();

  /// Clears the observable list of linked workers.
  void clean() => list$.clear();

  /// Removes a linked worker from the local observable list by matching the UID.
  ///
  /// [linkedWorker] is the model to be removed from the list.
  void removeFromLocal(LinkedWorkerModel linkedWorker) => list$.removeWhere((lw) => lw.uid == linkedWorker.uid);

  /// Fetches all linked workers for a given company ID and updates the observable list.
  ///
  /// [companyId] is the ID of the company whose linked workers are to be fetched.
  Future<void> fetchAll(String companyId) async {
    if (companyId == '') return;
    final snapshot = await _linkedWorkersRef(companyId).get();
    list$.assignAll(snapshot.docs.map(LinkedWorkerModel.fromSnapshot).toList());
  }

  /// Fetches a single linked worker document by company and worker ID.
  ///
  /// Returns the [LinkedWorkerModel] if found; otherwise, null.
  /// [companyId] is the ID of the company, and [workerId] is the ID of the worker.
  Future<LinkedWorkerModel?> get(String companyId, String workerId) async {
    if (companyId.isEmpty || workerId.isEmpty) return null;
    final docSnapshot = await _getDocumentReference(companyId, workerId).get();
    return docSnapshot.exists ? LinkedWorkerModel.fromSnapshot(docSnapshot) : null;
  }

  Future<void> linkWorkerToCompany(WorkerModel worker, String companyId, txn) async {
    final linkedWorker = LinkedWorkerModel.fromWorkerModel(worker, WorkerRole.owner);
    await create(companyId, linkedWorker, txn: txn);
  }

  /// Creates a linked worker document in Firestore.
  ///
  /// If a [txn] is provided, the creation is part of the given transaction.
  /// Returns the [LinkedWorkerModel] after creation.
  Future<LinkedWorkerModel> create(String companyId, LinkedWorkerModel linkedWorker, {Transaction? txn}) async {
    final docRef = _getDocumentReference(companyId, linkedWorker.uid);
    txn != null ? txn.set(docRef, linkedWorker.toMap()) : await docRef.set(linkedWorker.toMap());
    return linkedWorker;
  }

  /// Deletes a linked worker document from Firestore.
  ///
  /// If a [txn] is provided, the deletion is part of the given transaction.
  /// [companyId] is the ID of the company, and [workerId] is the ID of the worker to delete.
  Future<void> delete(String companyId, String workerId, {Transaction? txn}) async {
    final docRef = _getDocumentReference(companyId, workerId);
    txn != null ? txn.delete(docRef) : await docRef.delete();
  }

  /// Returns a [DocumentReference] for a linked worker within a company.
  DocumentReference _getDocumentReference(String companyId, String docId) => _linkedWorkersRef(companyId).doc(docId);

  /// Returns a [CollectionReference] for the linked workers subcollection of a company.
  CollectionReference<Map<String, dynamic>> _linkedWorkersRef(String companyId) {
    return _companiesRef.doc(companyId).collection(FirestoreCollections.linkedWorkers);
  }
}

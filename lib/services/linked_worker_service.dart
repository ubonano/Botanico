import 'package:botanico/config/firestore_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/enums/worker_role.dart';
import '../models/linked_worker_model.dart';
import '../models/worker_model.dart';
import '../utils/custom_service.dart';

/// Manages operations related to linked workers in Firestore.
///
/// This service provides functionalities to manage the linked workers subcollection within
/// a company document in Firestore. It allows fetching, creating, deleting, and
/// linking workers to companies.
class LinkedWorkerService extends GetxService with CustomService {
  @override
  String get logTag => 'LinkedWorkerService';

  /// Reference to the companies collection in Firestore.
  final _companiesRef = FirebaseFirestore.instance.collection(FirestoreCollections.companies);

  /// Observable list of linked workers.
  final list$ = RxList<LinkedWorkerModel>();

  /// Clears the observable list of linked workers.
  void clean() => list$.clear();

  /// Removes a linked worker from the local observable list by UID.
  ///
  /// This method removes the worker from the list$ based on matching UID.
  /// [linkedWorker] is the model to be removed.
  void removeFromLocal(LinkedWorkerModel linkedWorker) => list$.removeWhere((lw) => lw.uid == linkedWorker.uid);

  /// Fetches all linked workers for a given company and updates the observable list.
  ///
  /// [companyId] is the unique identifier of the company whose linked workers are fetched.
  Future<void> fetchAll(String companyId) async {
    final snapshot = await _linkedWorkersRef(companyId).get();
    list$.assignAll(snapshot.docs.map(LinkedWorkerModel.fromSnapshot).toList());
  }

  //TODO documentar
  Future<bool> isWorkerAlreadyLinked(String companyId, WorkerModel worker) async =>
      (await get(companyId, worker.uid)) != null;

  /// Retrieves a single linked worker by company and worker ID.
  ///
  /// Returns a [LinkedWorkerModel] if found, otherwise returns null.
  /// [companyId] and [workerId] are the unique identifiers for the company and worker, respectively.
  Future<LinkedWorkerModel?> get(String companyId, String workerId) async {
    final docSnapshot = await _getDocumentReference(companyId, workerId).get();
    return docSnapshot.exists ? LinkedWorkerModel.fromSnapshot(docSnapshot) : null;
  }

  /// Links a worker to a company by creating a linked worker document in Firestore.
  ///
  /// This method creates a linked worker document within the specified company's subcollection.
  /// [worker] is the worker to link, and [companyId] is the company to which the worker is being linked.
  /// [txn] is an optional transaction within which the linking should be performed.
  Future<void> linkWorkerToCompany(WorkerModel worker, String companyId, WorkerRole role, {Transaction? txn}) async {
    final linkedWorker = LinkedWorkerModel.fromWorkerModel(worker, role);
    await create(companyId, linkedWorker, txn: txn);
  }

  /// Creates a linked worker document in Firestore within a company's subcollection.
  ///
  /// Returns the created [LinkedWorkerModel]. If [txn] is provided, the creation is part of that transaction.
  /// [companyId] is the ID of the company. [linkedWorker] is the model to be created.
  Future<LinkedWorkerModel> create(String companyId, LinkedWorkerModel linkedWorker, {Transaction? txn}) async {
    final docRef = _getDocumentReference(companyId, linkedWorker.uid);
    txn != null ? txn.set(docRef, linkedWorker.toMap()) : await docRef.set(linkedWorker.toMap());
    return linkedWorker;
  }

  /// Deletes a linked worker document from a company's subcollection in Firestore.
  ///
  /// [companyId] is the ID of the company. [workerId] is the ID of the worker to delete.
  /// If [txn] is provided, the deletion is part of that transaction.
  Future<void> delete(String companyId, String workerId, {Transaction? txn}) async {
    final docRef = _getDocumentReference(companyId, workerId);
    txn != null ? txn.delete(docRef) : await docRef.delete();
  }

  /// Returns a [DocumentReference] for a specific linked worker within a company's subcollection.
  DocumentReference _getDocumentReference(String companyId, String docId) => _linkedWorkersRef(companyId).doc(docId);

  /// Returns a [CollectionReference] for the linked workers subcollection of a company.
  CollectionReference<Map<String, dynamic>> _linkedWorkersRef(String companyId) =>
      _companiesRef.doc(companyId).collection(FirestoreCollections.linkedWorkers);
}

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/config/firestore_collections.dart';
import '../utils/custom_service.dart';
import '../models/worker_model.dart';

/// Provides functionality for managing worker data within Firestore.
///
/// This service encapsulates operations such as fetching, creating, updating,
/// and specifically updating a worker's company association within the Firestore database.
class WorkerService extends GetxService with CustomService {
  @override
  String get logTag => 'WorkerService';

  /// Reference to the workers collection within Firestore.
  final _collectionRef = FirebaseFirestore.instance.collection(FirestoreCollections.workers);

  /// An observable representing the currently selected worker.
  final worker$ = Rx<WorkerModel?>(null);

  /// Clears the current worker observable value, effectively deselecting any worker.
  void clean() => worker$.value = null;

  /// Fetches a worker document by ID and updates the observable [worker$].
  ///
  /// [id] is the unique Firestore document ID of the worker.
  Future<void> fetch(String id) async => worker$.value = await _getWorker(id);

  /// Retrieves a worker document by its unique ID.
  ///
  /// [id] is the Firestore document ID of the worker.
  /// Returns a [WorkerModel] instance if found; otherwise, returns null.
  Future<WorkerModel?> get(String id) async => await _getWorker(id);

  /// Internal method to fetch a worker document by its ID.
  ///
  /// Performs a Firestore query to retrieve the worker document.
  /// [id] is the unique ID of the worker document.
  /// Returns the worker model if the document exists; otherwise, null.
  Future<WorkerModel?> _getWorker(String id) async {
    if (id.isEmpty) return null;
    final docSnapshot = await _getDocumentReference(id).get();
    return docSnapshot.exists ? WorkerModel.fromSnapshot(docSnapshot) : null;
  }

  /// Creates or updates a worker document within Firestore.
  ///
  /// This method either creates a new worker document with the provided data or updates an existing one.
  /// [worker] contains the worker data to be saved.
  /// [txn] optionally specifies a Firestore transaction within which to perform the save operation.
  /// Returns the updated [WorkerModel].
  Future<WorkerModel> create(WorkerModel worker, {Transaction? txn}) async {
    final docRef = _getDocumentReference(worker.uid);
    txn != null ? txn.set(docRef, worker.toMap()) : await docRef.set(worker.toMap());
    return worker;
  }

  /// Specifically updates a worker document to associate it with a company.
  ///
  /// This method is used to update the 'companyId' field of a worker, effectively linking the worker to a company.
  /// [worker] is the worker model to update.
  /// [companyId] is the ID of the company to associate with the worker.
  /// [txn] optionally specifies a Firestore transaction within which to perform the update.
  Future<void> updateWorkerWithCompanyId(WorkerModel worker, String companyId, {Transaction? txn}) async {
    final updatedWorker = worker.copyWith(companyId: companyId);
    await update(updatedWorker, txn: txn);
  }

  Future<void> cleanWorkersCompanyId(String workerId, {Transaction? txn}) async {
    final worker = await get(workerId);
    await update(worker!.copyWith(companyId: ''), txn: txn);
  }

  /// Updates an existing worker document with new data.
  ///
  /// [worker] contains the updated data for the worker.
  /// [txn] optionally specifies a Firestore transaction within which to perform the update.
  Future<void> update(WorkerModel worker, {Transaction? txn}) async {
    final docRef = _getDocumentReference(worker.uid);
    txn != null ? txn.update(docRef, worker.toMap()) : await docRef.update(worker.toMap());
  }

  /// Retrieves a [DocumentReference] for a specific worker by their ID.
  ///
  /// [id] is the unique ID of the worker within Firestore.
  DocumentReference _getDocumentReference(String id) => _collectionRef.doc(id);
}

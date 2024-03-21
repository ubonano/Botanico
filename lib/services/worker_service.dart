import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/config/firestore_collections.dart';
import '../utils/custom_service.dart';
import '../models/worker_model.dart';

/// Provides functionality for managing worker data in Firestore.
///
/// This service allows fetching, creating, and updating worker documents
/// within the Firestore database. It utilizes the [CustomService] for
/// logging and other common service functionalities.
class WorkerService extends GetxService with CustomService {
  @override
  String get logTag => 'WorkerService';

  /// Reference to the workers collection in Firestore.
  final _collectionRef = FirebaseFirestore.instance.collection(FirestoreCollections.workers);

  /// A reactive representation of the currently selected worker.
  final worker$ = Rx<WorkerModel?>(null);

  /// Clears the current worker value.
  void clean() => worker$.value = null;

  /// Fetches a worker by ID and updates the observable [worker$].
  ///
  /// [id] is the Firestore document ID of the worker.
  Future<void> fetch(String id) async => worker$.value = await _getWorker(id);

  /// Retrieves a worker by ID.
  ///
  /// [id] is the Firestore document ID of the worker.
  /// Returns a [WorkerModel] if found, otherwise null.
  Future<WorkerModel?> get(String id) async => await _getWorker(id);

  /// Internal method to fetch a worker document by ID.
  ///
  /// [id] is the Firestore document ID of the worker.
  /// Returns a [WorkerModel] if the document exists, otherwise null.
  Future<WorkerModel?> _getWorker(String id) async {
    if (id == '') return null;
    final docSnapshot = await _getDocumentReference(id).get();
    return docSnapshot.exists ? WorkerModel.fromSnapshot(docSnapshot) : null;
  }

  /// Creates a new worker document or updates an existing one.
  ///
  /// [worker] is the worker data to save.
  /// [txn] is an optional Firestore transaction.
  /// Returns the [WorkerModel] after the operation.
  Future<WorkerModel> create(WorkerModel worker, {Transaction? txn}) async {
    final docRef = _getDocumentReference(worker.uid);
    txn != null ? txn.set(docRef, worker.toMap()) : await docRef.set(worker.toMap());
    return worker;
  }

  /// Updates an existing worker document.
  ///
  /// [worker] is the worker data to update.
  /// [txn] is an optional Firestore transaction.
  Future<void> update(WorkerModel worker, {Transaction? txn}) async {
    final docRef = _getDocumentReference(worker.uid);
    txn != null ? txn.update(docRef, worker.toMap()) : await docRef.update(worker.toMap());
  }

  /// Returns a [DocumentReference] for a given worker ID.
  ///
  /// [id] is the Firestore document ID of the worker.
  DocumentReference _getDocumentReference(String id) => _collectionRef.doc(id);
}

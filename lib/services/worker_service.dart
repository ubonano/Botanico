import 'dart:async';
import 'package:botanico/models/enums/worker_role.dart';
import 'package:botanico/utils/custom_exceptions.dart';
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

  /// Updates a worker document to set their role within the company.
  ///
  /// This method modifies a worker's document to define their role within the company.
  /// It's useful for specifying or changing a worker's role, such as promoting or demoting them.
  ///
  /// [worker] is the worker whose role is being updated.
  /// [role] is the new role assigned to the worker, defined by the [WorkerRole] enum.
  /// [txn] is an optional parameter that specifies a Firestore transaction within which
  /// this update operation should be executed. If not provided, the update occurs outside of any transactions.
  Future<void> updateWorkerWithRole(WorkerModel worker, WorkerRole role, {Transaction? txn}) async {
    final updatedWorker = worker.copyWith(role: role);
    await update(updatedWorker, txn: txn);
  }

  /// Updates both the company association and role of a worker within Firestore.
  ///
  /// This method simultaneously updates the company association and role of the specified worker.
  /// It is particularly useful for operations where both the worker's company and their role within
  /// that company need to be updated at the same time, optimizing the process by making a single update call.
  ///
  /// [worker] is the instance of the worker to be updated. This should be a fully initialized
  /// WorkerModel object representing the worker whose company and role are being updated.
  /// [companyId] is the unique identifier of the company to which the worker is being associated.
  /// It links the worker to the specified company.
  /// [role] is the new role assigned to the worker within the company, defined by the [WorkerRole] enum.
  /// [txn] is an optional parameter that specifies a Firestore transaction within which
  /// this update operation should be executed. Providing a Transaction object allows
  /// for this operation to be part of a larger, atomic transaction. If not provided,
  /// the update will be performed outside of any transaction context.
  ///
  /// The method performs an update on the worker document within Firestore, setting both
  /// the 'companyId' and 'role' fields to the specified values. This operation is atomic;
  /// both fields are updated together in a single transaction if one is provided.
  Future<void> updateWorkerCompanyAndRole(
    WorkerModel worker,
    String companyId,
    WorkerRole role, {
    Transaction? txn,
  }) async {
    final updatedWorker = worker.copyWith(companyId: companyId, role: role);
    await update(updatedWorker, txn: txn);
  }

  /// Removes the company association and resets the role of a specified worker.
  ///
  /// This method is used to unset the 'companyId' field and reset the 'role' field of a worker to `WorkerRole.undefined`,
  /// effectively removing any link between the worker and a company and resetting their role.
  /// This operation is useful when a worker leaves a company, or when cleaning up data,
  /// ensuring that the worker no longer has any association with the company or a specific role within it.
  ///
  /// [workerId] is the unique ID of the worker whose company association and role are to be reset.
  /// [txn] optionally specifies a Firestore transaction within which to perform the operation.
  /// Providing a Transaction object allows for this operation to be part of a larger, atomic transaction.
  ///
  /// Throws a [CustomException] with the message 'Worker not found' if the worker document could not be found
  /// or if the operation cannot be completed for any other reason.
  Future<void> cleanWorkerCompanyIdAndRole(String workerId, {Transaction? txn}) async {
    final worker = await get(workerId);
    if (worker == null) throw CustomException(message: 'Worker not found');
    await update(worker.copyWith(companyId: '', role: WorkerRole.undefined), txn: txn);
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

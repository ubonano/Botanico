import 'dart:async';
import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:botanico/modules/worker/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class WorkerService extends GetxService with LifeCycleLogService, ContextService {
  @override
  String get logTag => 'WorkerService';
  late final LinkedWorkerService _linkedWorkerService = Get.find();
  late final CollectionReference _collectionRef = firestore.collection(FirestoreCollections.workers);

  Future<WorkerModel?> get(String id) async => await _getWorker(id);

  Future<WorkerModel?> _getWorker(String id) async {
    if (id.isEmpty) return null;
    final docSnapshot = await _getDocumentReference(id).get();
    return docSnapshot.exists ? WorkerModel.fromSnapshot(docSnapshot) : null;
  }

  Future<void> create(WorkerModel worker, {Transaction? txn}) async {
    final newWorker = worker.copyWith(uid: session.userUID, email: session.userEmail);
    final docRef = _getDocumentReference(newWorker.uid);
    txn != null ? txn.set(docRef, newWorker.toMap()) : await docRef.set(newWorker.toMap());
  }

  Future<void> updateWorkerWithCompanyId(WorkerModel worker, String companyId, {Transaction? txn}) async {
    final updatedWorker = worker.copyWith(companyId: companyId);
    await update(updatedWorker, txn: txn);
  }

  Future<void> updateWorkerWithRole(WorkerModel worker, WorkerRole role, {Transaction? txn}) async {
    final updatedWorker = worker.copyWith(role: role);
    await update(updatedWorker, txn: txn);
  }

  Future<void> updateWorkerCompanyAndRole(
    WorkerModel worker,
    String companyId,
    WorkerRole role, {
    Transaction? txn,
  }) async {
    final updatedWorker = worker.copyWith(companyId: companyId, role: role);
    await update(updatedWorker, txn: txn);

    await _linkedWorkerService.linkWorkerToCompany(
      worker,
      companyId,
      role: role,
      txn: txn,
    );
  }

  Future<void> cleanWorkerCompanyIdAndRole(String workerId, {Transaction? txn}) async {
    final worker = await get(workerId);
    if (worker == null) throw CustomException(message: 'Worker not found');
    await update(worker.copyWith(companyId: '', role: WorkerRole.undefined), txn: txn);
  }

  Future<void> update(WorkerModel worker, {Transaction? txn}) async {
    final docRef = _getDocumentReference(worker.uid);
    txn != null ? txn.update(docRef, worker.toMap()) : await docRef.update(worker.toMap());
  }

  DocumentReference _getDocumentReference(String id) => _collectionRef.doc(id);
}

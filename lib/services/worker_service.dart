import 'dart:async';
import 'package:botanico/models/enums/worker_role.dart';
import 'package:botanico/utils/custom_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/config/firestore_collections.dart';
import '../utils/life_cycle_log_service.dart';
import '../models/worker_model.dart';

class WorkerService extends GetxService with LifeCycleLogService {
  @override
  String get logTag => 'WorkerService';

  final FirebaseFirestore _firestore = Get.find();
  late final CollectionReference _collectionRef;

  WorkerService() {
    _collectionRef = _firestore.collection(FirestoreCollections.workers);
  }

  Future<WorkerModel?> get(String id) async => await _getWorker(id);

  Future<WorkerModel?> _getWorker(String id) async {
    if (id.isEmpty) return null;
    final docSnapshot = await _getDocumentReference(id).get();
    return docSnapshot.exists ? WorkerModel.fromSnapshot(docSnapshot) : null;
  }

  Future<WorkerModel> create(WorkerModel worker, {Transaction? txn}) async {
    final docRef = _getDocumentReference(worker.uid);
    txn != null ? txn.set(docRef, worker.toMap()) : await docRef.set(worker.toMap());
    return worker;
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

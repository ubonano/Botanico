import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/config/firestore_collections.dart';
import '../utils/custom_service.dart';
import '../models/worker_model.dart';

class WorkerService extends GetxService with CustomService {
  @override
  String get logTag => 'WorkerService';

  final _collectionRef = FirebaseFirestore.instance.collection(FirestoreCollections.workers);

  final worker$ = Rx<WorkerModel?>(null);

  void clean() => worker$.value = null;

  Future<void> fetch(String id) async => worker$.value = await _getWorker(id);

  Future<WorkerModel?> get(String id) async => await _getWorker(id);

  Future<WorkerModel?> _getWorker(String id) async {
    final docSnapshot = await _getDocumentReference(id).get();
    return docSnapshot.exists ? WorkerModel.fromSnapshot(docSnapshot) : null;
  }

  Future<WorkerModel> create(WorkerModel worker, {Transaction? txn}) async {
    final docRef = _getDocumentReference(worker.uid);
    txn != null ? txn.set(docRef, worker.toMap()) : await docRef.set(worker.toMap());
    return worker;
  }

  Future<void> update(WorkerModel worker, {Transaction? txn}) async {
    final docRef = _getDocumentReference(worker.uid);
    txn != null ? txn.update(docRef, worker.toMap()) : await docRef.update(worker.toMap());
  }

  DocumentReference _getDocumentReference(String id) => _collectionRef.doc(id);
}

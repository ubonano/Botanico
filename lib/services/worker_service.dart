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

  Future<void> fetch(String id) async {
    final snapshot = await _collectionRef.doc(id).get();
    worker$.value = snapshot.exists ? WorkerModel.fromSnapshot(snapshot) : null;
  }

  Future<WorkerModel> create(WorkerModel worker, {Transaction? txn}) async {
    DocumentReference docRef = _collectionRef.doc(worker.uid);

    if (txn != null) {
      txn.set(docRef, worker.toMap());
    } else {
      await docRef.set(worker.toMap());
    }

    return worker;
  }

  Future<void> update(WorkerModel worker, {Transaction? txn}) async {
    DocumentReference docRef = _collectionRef.doc(worker.uid);

    if (txn != null) {
      txn.update(docRef, worker.toMap());
    } else {
      await docRef.update(worker.toMap());
    }
  }

  void clean() => worker$.value = null;
}

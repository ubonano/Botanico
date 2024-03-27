import 'package:botanico/auxiliaries/firestore_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../module.dart';

class WorkerRepository {
  final FirebaseFirestore _firestore = Get.find();
  late final CollectionReference _collectionRef = _firestore.collection(FirestoreCollections.workers);

  Future<WorkerModel?> get(String id) async {
    if (id.isEmpty) return null;
    final docSnapshot = await _collectionRef.doc(id).get();
    return docSnapshot.exists ? WorkerModel.fromSnapshot(docSnapshot) : null;
  }

  Future<void> create(WorkerModel worker, {Transaction? txn}) async {
    final docRef = _collectionRef.doc(worker.uid);
    txn != null ? txn.set(docRef, worker.toMap()) : await docRef.set(worker.toMap());
  }

  Future<void> update(WorkerModel worker, {Transaction? txn}) async {
    final docRef = _collectionRef.doc(worker.uid);
    txn != null ? txn.update(docRef, worker.toMap()) : await docRef.update(worker.toMap());
  }
}

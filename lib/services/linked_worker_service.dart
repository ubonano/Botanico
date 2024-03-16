import 'dart:async';
import 'package:botanico/models/linked_worker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/config/firestore_collections.dart';
import '../utils/custom_service.dart';

class LinkedWorkerService extends GetxService with CustomService {
  @override
  String get logTag => 'LinkedWorkerService';

  final _companiesRef = FirebaseFirestore.instance.collection(FirestoreCollections.companies);

  Future<LinkedWorkerModel> create(String companyId, LinkedWorkerModel linkedWorker, {Transaction? txn}) async {
    DocumentReference docRef =
        _companiesRef.doc(companyId).collection(FirestoreCollections.linkedWorkers).doc(linkedWorker.uid);

    if (txn != null) {
      txn.set(docRef, linkedWorker.toMap());
    } else {
      await docRef.set(linkedWorker.toMap());
    }

    return linkedWorker;
  }
}

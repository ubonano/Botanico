import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:botanico/modules/company/module.dart';

import '../module.dart';

class LinkedWorkerRepository implements ILinkedWorkerRepository {
  late final FirebaseFirestore _firestore = Get.find();

  String get _companyId => Get.find<ICompanyBusinessLogic>().currentCompany$!.uid;

  @override
  Future<void> link(WorkerModel worker, {Transaction? txn}) async {
    final docRef = _linkedWorkersRef().doc(worker.uid);
    txn != null ? txn.set(docRef, worker.toLinkedWorkerMap()) : await docRef.set(worker.toLinkedWorkerMap());
  }

  @override
  Future<void> unlink(String id, {Transaction? txn}) async {
    final docRef = _linkedWorkersRef().doc(id);
    txn != null ? txn.delete(docRef) : await docRef.delete();
  }

  @override
  Stream<List<WorkerModel>> initStream({DocumentSnapshot? startAfter, int limit = 20}) {
    var query = _linkedWorkersRef().limit(limit);

    if (startAfter != null) {
      query = query.startAfterDocument(startAfter);
    }

    return query.snapshots().map((snapshot) => snapshot.docs.map(WorkerModel.fromSnapshot).toList());
  }

  CollectionReference<Map<String, dynamic>> _linkedWorkersRef() =>
      _firestore.collection(CompanyModel.collectionName).doc(_companyId).collection(WorkerModel.collectionName);
}

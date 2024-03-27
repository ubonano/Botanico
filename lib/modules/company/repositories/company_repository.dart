import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../module.dart';

class CompanyRepository {
  final FirebaseFirestore _firestore = Get.find();
  late final CollectionReference _collectionRef = _firestore.collection(FirestoreCollections.companies);

  Future<CompanyModel?> get(String id) async {
    if (id.isEmpty) return null;
    final docSnapshot = await _collectionRef.doc(id).get();
    return docSnapshot.exists ? CompanyModel.fromSnapshot(docSnapshot) : null;
  }

  String generateId() => _collectionRef.doc().id;

  Future<void> create(CompanyModel company, {Transaction? txn}) async {
    if (company.uid.isEmpty) throw Exception('Company Id was empty');

    DocumentReference docRef = _collectionRef.doc(company.uid);

    txn != null ? txn.set(docRef, company.toMap()) : await docRef.set(company.toMap());
  }

  Future<void> update(CompanyModel company, {Transaction? txn}) async {
    DocumentReference docRef = _collectionRef.doc(company.uid);
    txn != null ? txn.update(docRef, company.toMap()) : await docRef.update(company.toMap());
  }
}

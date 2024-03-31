import 'package:botanico/modules/foundation/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../module.dart';

class CompanyRepository {
  final FirebaseFirestore _firestore = Get.find();

  String get generateId => _companyRef.doc().id;

  Future<CompanyModel?> get(String id) async {
    final docSnapshot = await _companyRef.doc(id).get();
    return docSnapshot.exists ? CompanyModel.fromSnapshot(docSnapshot) : null;
  }

  Future<void> create(CompanyModel company) async {
    DocumentReference docRef = _companyRef.doc(company.uid);

    await docRef.set(company.toMap());
  }

  CollectionReference<Map<String, dynamic>> get _companyRef => _firestore.collection(FirestoreCollections.companies);
}

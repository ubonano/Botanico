import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'setup/interfaces/i_company_repository.dart';

class CompanyRepository implements ICompanyRepository {
  late final FirebaseFirestore _firestore = Get.find();

  @override
  String get generateId => _companyRef.doc().id;

  @override
  Future<CompanyModel?> get(String id) async {
    final docSnapshot = await _companyRef.doc(id).get();
    return docSnapshot.exists ? CompanyModel.fromSnapshot(docSnapshot) : null;
  }

  @override
  Future<void> create(CompanyModel company, {Transaction? txn}) async {
    final docRef = _companyRef.doc(company.uid);
    txn != null ? txn.set(docRef, company.toMap()) : await docRef.set(company.toMap());
  }

  @override
  Future<void> update(CompanyModel company, {Transaction? txn}) async {
    final docRef = _companyRef.doc(company.uid);
    txn != null ? txn.update(docRef, company.toMap()) : await docRef.update(company.toMap());
  }

  CollectionReference<Map<String, dynamic>> get _companyRef => _firestore.collection(CompanyModel.collectionName);
}

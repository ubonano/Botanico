import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../company_module.dart';

class CompanyRepository {
  final FirebaseFirestore _firestore = Get.find();

  final Rx<CompanyModel?> _currentCompany$ = Rx<CompanyModel?>(null);
  CompanyModel? get currentCompany$ => _currentCompany$.value;

  String get generateId => _companyRef.doc().id;

  Future<CompanyModel?> fetch(String id) async {
    if (id.isEmpty) return null;
    _currentCompany$.value ??= await get(id);
    return _currentCompany$.value;
  }

  Future<CompanyModel?> get(String id) async {
    if (_currentCompany$.value != null) return currentCompany$;

    final docSnapshot = await _companyRef.doc(id).get();
    _currentCompany$.value = docSnapshot.exists ? CompanyModel.fromSnapshot(docSnapshot) : null;

    return _currentCompany$.value;
  }

  Future<void> create(CompanyModel company, {Transaction? txn}) async {
    DocumentReference docRef = _companyRef.doc(company.uid);

    txn != null ? txn.set(docRef, company.toMap()) : await docRef.set(company.toMap());
  }

  CollectionReference<Map<String, dynamic>> get _companyRef => _firestore.collection(FirestoreCollections.companies);

  void clearCurrentCompany() => _currentCompany$.value = null;
}

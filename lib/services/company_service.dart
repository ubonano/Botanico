import 'package:botanico/config/firestore_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../utils/custom_service.dart';
import '../models/company_model.dart';

class CompanyService extends GetxService with CustomService {
  @override
  String get logTag => 'CompanyService';

  final _collectionRef = FirebaseFirestore.instance.collection(FirestoreCollections.companies);

  final company$ = Rx<CompanyModel?>(null);

  void clean() => company$.value = null;

  Future<void> fetch(String id) async => company$.value = await _getCompany(id);

  Future<CompanyModel?> get(String id) async => await _getCompany(id);

  Future<CompanyModel?> _getCompany(String id) async {
    final docSnapshot = await _getDocumentReference(id).get();
    return docSnapshot.exists ? CompanyModel.fromSnapshot(docSnapshot) : null;
  }

  Future<CompanyModel> create(CompanyModel company, {Transaction? txn}) async {
    DocumentReference docRef = _collectionRef.doc();
    CompanyModel newCompany = company.copyWith(uid: docRef.id);

    txn != null ? txn.set(docRef, newCompany.toMap()) : await docRef.set(newCompany.toMap());

    return newCompany;
  }

  Future<void> update(CompanyModel company, {Transaction? txn}) async {
    DocumentReference docRef = _collectionRef.doc(company.uid);

    txn != null ? txn.update(docRef, company.toMap()) : await docRef.update(company.toMap());
  }

  DocumentReference _getDocumentReference(String id) => _collectionRef.doc(id);
}

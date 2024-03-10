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

  Future<void> fetch(String id) async {
    final snapshot = await _collectionRef.doc(id).get();
    company$.value = snapshot.exists ? CompanyModel.fromSnapshot(snapshot) : null;
  }

  Future<void> create(CompanyModel company) async {
    await _collectionRef.doc().set(company.toMap());
  }

  void clean() => company$.value = null;
}

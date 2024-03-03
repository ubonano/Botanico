import 'package:botanico/modules/foundation/config/firestore_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../foundation/utils/custom_service.dart';
import 'company_model.dart';

class CompanyService extends GetxService with CustomService {
  @override
  String get logTag => 'CompanyService';

  final _collectionRef = FirebaseFirestore.instance.collection(FirestoreCollections.companies);
  final company$ = Rx<CompanyModel?>(null);

  Future<void> fetchById(String id) async {
    final snapshot = await _collectionRef.doc(id).get();
    company$.value = snapshot.exists ? CompanyModel.fromSnapshot(snapshot) : null;
  }

  Future<void> set(CompanyModel company) async {
    final docRef = company.uid.isNotEmpty ? _collectionRef.doc(company.uid) : _collectionRef.doc();
    await docRef.set(company.toMap());
  }

  void clean() => company$.value = null;
}

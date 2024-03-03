import 'package:botanico/modules/foundation/config/firestore_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../foundation/utils/custom_service.dart';
import 'company_profile_model.dart';

class CompanyProfileService extends GetxService with CustomService {
  @override
  String get logTag => 'CompanyProfileService';

  final _collectionRef = FirebaseFirestore.instance.collection(FirestoreCollections.companyProfiles);
  final companyProfile$ = Rx<CompanyProfileModel?>(null);

  Future<void> fetchById(String id) async {
    final snapshot = await _collectionRef.doc(id).get();
    companyProfile$.value = snapshot.exists ? CompanyProfileModel.fromSnapshot(snapshot) : null;
  }

  Future<void> set(CompanyProfileModel companyProfile) async {
    final docRef = companyProfile.uid.isNotEmpty ? _collectionRef.doc(companyProfile.uid) : _collectionRef.doc();
    await docRef.set(companyProfile.toMap());
  }

  void clean() => companyProfile$.value = null;
}

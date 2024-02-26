import 'package:botanico/modules/foundation/config/firestore_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../foundation/utils/log_lifecycle.dart';
import 'company_profile_model.dart';
import '../foundation/services/common_services.dart';

class CompanyProfileService extends GetxService with CommonServices, LogLifecycleService {
  @override
  String get logTag => 'CompanyProfileService';

  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection(FirestoreCollections.companyProfiles);

  final Rx<CompanyProfileModel?> companyProfileObx = Rx<CompanyProfileModel?>(null);

  CompanyProfileModel? get currentCompanyProfile => companyProfileObx.value;
  bool get isCompanyProfile => companyProfileObx.value != null;

  void setCompanyProfileObx(CompanyProfileModel? companyProfileModel) => companyProfileObx.value = companyProfileModel;
  void cleanCompanyProfile() => setCompanyProfileObx(null);

  Future<void> fetchUserProfile(String uid) async => setCompanyProfileObx(await getCompanyProfile(uid));

  Future<CompanyProfileModel?> getCompanyProfile(String id) async {
    final docSnapshot = await _collectionReference.doc(id).get();

    if (docSnapshot.exists) {
      final companyProfile = CompanyProfileModel.fromSnapshot(docSnapshot);
      return companyProfile;
    }

    return null;
  }

  Future<CompanyProfileModel?> getCompanyProfileByOwner(String ownerUid) async {
    final querySnapshot = await _collectionReference.where('ownerUid', isEqualTo: ownerUid).limit(1).get();

    if (querySnapshot.docs.isNotEmpty) {
      final docSnapshot = querySnapshot.docs.first;
      final companyProfile = CompanyProfileModel.fromSnapshot(docSnapshot);

      return companyProfile;
    }

    return null;
  }

  Future<void> updateCompanyProfile(CompanyProfileModel companyProfile) async {
    await _collectionReference.doc(companyProfile.uid).set(companyProfile.toMap());
    setCompanyProfileObx(companyProfile);
  }

  Future<void> createCompanyProfile(CompanyProfileModel companyProfile) async {
    await _collectionReference.doc().set(companyProfile.toMap());
    setCompanyProfileObx(companyProfile);
  }
}

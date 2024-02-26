import 'package:botanico/modules/foundation/config/firestore_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../foundation/utils/log_lifecycle.dart';
import 'company_profile_model.dart';
import '../foundation/services/common_services.dart';

class CompanyProfileService extends GetxService with CommonServices, LogLifecycleService {
  @override
  String get logTag => 'CompanyService';

  final CollectionReference _companyProfilesCollection =
      FirebaseFirestore.instance.collection(FirestoreCollections.companyProfiles);

  final Rx<CompanyProfileModel?> companyProfileObx = Rx<CompanyProfileModel?>(null);

  CompanyProfileModel? get companyProfile => companyProfileObx.value;
  bool get isCompanyProfile => companyProfileObx.value != null;

  void setCompanyProfileObx(CompanyProfileModel? companyProfileModel) => companyProfileObx.value = companyProfileModel;

  Future<CompanyProfileModel?> fetchCompanyProfile(String uid) async {
    final docSnapshot = await _companyProfilesCollection.doc(uid).get();

    if (docSnapshot.exists) {
      final companyProfile = CompanyProfileModel.fromMap(docSnapshot.data() as Map<String, dynamic>);
      setCompanyProfileObx(companyProfile);
      return companyProfile;
    }

    return null;
  }

  Future<void> createCompanyProfile(CompanyProfileModel company) async {
    bool existCompanyByOwner = await _existsCompanyCreatedByOwner(company.ownerUid);

    if (existCompanyByOwner) {
      throw Exception('Usted ya posee una empresa registrada a su nombre');
    }

    DocumentReference companyRef = _companyProfilesCollection.doc();
    await companyRef.set(company.toMap());

    await fetchCompanyProfile(companyRef.id);

    navigationService.toLobby(); // Llevar al controller

    return await userProfileService.updateUserProfileWithCompanyUid(company.ownerUid, companyRef.id);
  }

  Future<bool> _existsCompanyCreatedByOwner(String ownerUid) async {
    final querySnapshot = await _companyProfilesCollection.where('ownerUid', isEqualTo: ownerUid).limit(1).get();

    return querySnapshot.docs.isNotEmpty;
  }
}

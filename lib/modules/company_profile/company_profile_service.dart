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

  final Rx<CompanyProfileModel?> currentCompanyProfileObx = Rx<CompanyProfileModel?>(null);

  CompanyProfileModel? get currentCompanyProfile => currentCompanyProfileObx.value;
  bool get hasCompanyProfile => currentCompanyProfileObx.value != null;

  void cleanCompanyProfile() => setCompanyProfileObx(null);
  void setCompanyProfileObx(CompanyProfileModel? companyProfileModel) =>
      currentCompanyProfileObx.value = companyProfileModel;

  Future<void> fetchCompanyProfile(String ownerUid) async =>
      setCompanyProfileObx(await getCompanyProfileByOwner(ownerUid));

  Future<CompanyProfileModel?> getCompanyProfileById(String id) async {
    final docSnapshot = await _collectionReference.doc(id).get();
    return docSnapshot.exists ? CompanyProfileModel.fromSnapshot(docSnapshot) : null;
  }

  Future<CompanyProfileModel?> getCompanyProfileByOwner(String ownerUid) async {
    final querySnapshot = await _collectionReference.where('ownerUid', isEqualTo: ownerUid).limit(1).get();
    return querySnapshot.docs.isNotEmpty ? CompanyProfileModel.fromSnapshot(querySnapshot.docs.first) : null;
  }

  Future<void> setOrUpdateCompanyProfile(CompanyProfileModel companyProfile) async {
    final docRef =
        companyProfile.uid.isNotEmpty ? _collectionReference.doc(companyProfile.uid) : _collectionReference.doc();

    await docRef.set(companyProfile.toMap());
  }
}

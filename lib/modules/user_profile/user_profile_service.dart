import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/config/firestore_collections.dart';
import '../foundation/services/common_services.dart';
import '../foundation/utils/log_lifecycle.dart';
import 'user_profile_model.dart';

class UserProfileService extends GetxService with CommonServices, LogLifecycleService {
  @override
  String get logTag => 'UserProfileService';

  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection(FirestoreCollections.userProfiles);

  final Rx<UserProfileModel?> userProfileObx = Rx<UserProfileModel?>(null);

  UserProfileModel? get currentUserProfile => userProfileObx.value;
  void setUserProfileObx(UserProfileModel? userProfileModel) => userProfileObx.value = userProfileModel;

  bool get isUserProfile => userProfileObx.value != null;

  void cleanUserProfile() => setUserProfileObx(null);

  Future<void> fetchUserProfile(String uid) async => setUserProfileObx(await getUserProfile(uid));

  Future<UserProfileModel?> getUserProfile(String id) async {
    final docSnapshot = await _collectionReference.doc(id).get();
    if (docSnapshot.exists) {
      final userProfile = UserProfileModel.fromMap(docSnapshot.data() as Map<String, dynamic>);
      return userProfile;
    }

    return null;
  }

  Future<void> setUserProfile(UserProfileModel userProfile) async {
    await _collectionReference.doc(userProfile.uid).set(userProfile.toMap());
    setUserProfileObx(userProfile);
  }

  Future<void> updateUserProfileWithCompanyUid(String userUid, String companyUid) async {
    await _collectionReference.doc(userUid).update({'companyUid': companyUid});

    await fetchUserProfile(userUid);
  }
}

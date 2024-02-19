import 'package:botanico/config/firestore_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_profile_model.dart';

class UserProfileService {
  final _userProfilesCollectionRef =
      FirebaseFirestore.instance.collection(FirestoreCollections.userProfile);

  UserProfileModel? _toUserProfileModel(DocumentSnapshot doc) {
    if (doc.exists) {
      return UserProfileModel.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  Future<UserProfileModel?> getUserProfile(String uid) async {
    final docSnapshot = await _userProfilesCollectionRef.doc(uid).get();
    return _toUserProfileModel(docSnapshot);
  }

  Future<void> setUserProfile(UserProfileModel user) async {
    await _userProfilesCollectionRef.doc(user.uid).set(user.toMap());
  }
}

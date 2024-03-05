import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/config/firestore_collections.dart';
import '../foundation/utils/custom_service.dart';
import 'user_profile_model.dart';

class UserProfileService extends GetxService with CustomService {
  @override
  String get logTag => 'UserProfileService';

  final _collectionRef = FirebaseFirestore.instance.collection(FirestoreCollections.userProfiles);

  final userProfile$ = Rx<UserProfileModel?>(null);

  Future<void> fetchById(String id) async {
    final snapshot = await _collectionRef.doc(id).get();
    userProfile$.value = snapshot.exists ? UserProfileModel.fromSnapshot(snapshot) : null;
  }

  Future<void> set(UserProfileModel userProfile) async {
    await _collectionRef.doc(userProfile.uid).set(userProfile.toMap());
  }

  void clean() => userProfile$.value = null;
}

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/config/firestore_collections.dart';
import '../../foundation/utils/custom_service.dart';
import '../models/profile_model.dart';

class ProfileService extends GetxService with CustomService {
  @override
  String get logTag => 'ProfileService';

  final _collectionRef = FirebaseFirestore.instance.collection(FirestoreCollections.profiles);

  final profile$ = Rx<ProfileModel?>(null);

  Future<void> fetch(String id) async {
    final snapshot = await _collectionRef.doc(id).get();
    profile$.value = snapshot.exists ? ProfileModel.fromSnapshot(snapshot) : null;
  }

  Future<void> create(ProfileModel profile) async {
    await _collectionRef.doc(profile.uid).set(profile.toMap());
  }

  void clean() => profile$.value = null;
}

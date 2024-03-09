import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:botanico/modules/foundation/config/firestore_collections.dart';
import '../../foundation/utils/custom_service.dart';
import '../models/user_model.dart';

class UserService extends GetxService with CustomService {
  @override
  String get logTag => 'UserService';

  final _collectionRef = FirebaseFirestore.instance.collection(FirestoreCollections.users);

  final user$ = Rx<UserModel?>(null);

  Future<void> fetch(String id) async {
    final snapshot = await _collectionRef.doc(id).get();
    user$.value = snapshot.exists ? UserModel.fromSnapshot(snapshot) : null;
  }

  Future<void> create(UserModel user) async {
    await _collectionRef.doc(user.uid).set(user.toMap());
  }

  void clean() => user$.value = null;
}

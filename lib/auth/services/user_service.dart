import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class UserService {
  final _usersCollectionRef = FirebaseFirestore.instance.collection('users');

  UserModel? _toUserModel(DocumentSnapshot doc) {
    if (doc.exists) {
      return UserModel.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  Future<UserModel?> getUserProfile(String uid) async {
    final docSnapshot = await _usersCollectionRef.doc(uid).get();
    return _toUserModel(docSnapshot);
  }

  Future<void> setUserProfile(UserModel user) async {
    await _usersCollectionRef.doc(user.uid).set(user.toMap());
  }
}

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../foundation/utils/custom_service.dart';

class AuthService extends GetxService with CustomService {
  @override
  String get logTag => 'AuthService';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get userChanges => _auth.authStateChanges();
  User? get user => _auth.currentUser;

  Future<User?> signIn(String email, String password) async {
    final UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  Future<User?> signUp(String email, String password) async {
    final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  Future<void> signOut() async => await _auth.signOut();

  Future<void> recoverPassword(String email) async => await _auth.sendPasswordResetEmail(email: email);
}

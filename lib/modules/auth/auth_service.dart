import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../foundation/services/common_services.dart';
import '../foundation/utils/log_lifecycle.dart';

class AuthService extends GetxService with CommonServices, LogLifecycleService {
  @override
  String get logTag => 'AuthService';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get userChanges => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;
  bool get isUserLoggedIn => currentUser != null;

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    final UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  Future<User?> createUserWithEmailAndPassword(String email, String password) async {
    final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  Future<void> signOut() async => await _auth.signOut();

  Future<void> recoverPassword(String email) async => await _auth.sendPasswordResetEmail(email: email);
}

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository {
  final FirebaseAuth _auth = Get.find();

  User? get currentUser => _auth.currentUser;

  bool get isLoggedInUser => currentUser != null;

  Future<User?> signIn(String email, String password) async =>
      (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;

  Future<User?> signUp(String email, String password) async =>
      (await _auth.createUserWithEmailAndPassword(email: email, password: password)).user;

  Future<void> signOut() async => await _auth.signOut();

  Future<void> recoverPassword(String email) async => await _auth.sendPasswordResetEmail(email: email);
}

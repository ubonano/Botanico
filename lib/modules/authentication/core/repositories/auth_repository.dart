import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthRepository {
  final FirebaseAuth _auth = Get.find();

  Stream<User?> get userChanges => _auth.authStateChanges();

  User? get user => _auth.currentUser;

  bool get isLoggedInUser => user != null;

  Future<User?> signIn(String email, String password) async =>
      (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;

  Future<User?> signUp(String email, String password) async =>
      (await _auth.createUserWithEmailAndPassword(email: email, password: password)).user;

  Future<void> signOut() async => await _auth.signOut();

  Future<void> recoverPassword(String email) async => await _auth.sendPasswordResetEmail(email: email);
}

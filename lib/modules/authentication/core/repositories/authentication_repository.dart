import 'dart:async';
import 'package:botanico/modules/authentication/module.dart';
import 'package:get/get.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  final FirebaseAuth _auth = Get.find();

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Future<User?> signIn(String email, String password) async =>
      (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;

  @override
  Future<User?> signUp(String email, String password) async =>
      (await _auth.createUserWithEmailAndPassword(email: email, password: password)).user;

  @override
  Future<void> signOut() async => await _auth.signOut();

  @override
  Future<void> recoverPassword(String email) async => await _auth.sendPasswordResetEmail(email: email);
}

import 'dart:async';
import 'package:botanico/auxiliaries/auxiliaries.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

/// A service to manage user authentication.
///
/// This class provides methods to handle signing in, signing up, signing out,
/// and password recovery using Firebase Authentication.
class AuthService extends GetxService with LifeCycleLogService {
  @override
  String get logTag => 'AuthService';

  final FirebaseAuth _auth = Get.find();

  /// Stream of authentication state changes.
  ///
  /// Listens for changes in the user's sign-in state (e.g., user signs in or out).
  Stream<User?> get userChanges => _auth.authStateChanges();

  /// Gets the current user.
  ///
  /// Returns the currently signed-in [User], or null if there is none.
  User? get user => _auth.currentUser;

  /// Signs in a user with an email and password.
  ///
  /// Attempts to sign in a user with the given [email] and [password].
  /// Returns the [User] on successful sign-in.
  ///
  /// Throws a [FirebaseAuthException] if there is an error.
  Future<User?> signIn(String email, String password) async {
    return (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
  }

  /// Signs up a user with an email and password.
  ///
  /// Attempts to create a new user with the given [email] and [password].
  /// Returns the newly created [User] on successful sign-up.
  ///
  /// Throws a [FirebaseAuthException] if there is an error.
  Future<User?> signUp(String email, String password) async {
    return (await _auth.createUserWithEmailAndPassword(email: email, password: password)).user;
  }

  /// Signs out the current user.
  ///
  /// Signs out the currently signed-in user and clears their session.
  Future<void> signOut() async => await _auth.signOut();

  /// Sends a password reset email to the given email address.
  ///
  /// Initiates a password reset for the user associated with the specified [email].
  Future<void> recoverPassword(String email) async => await _auth.sendPasswordResetEmail(email: email);
}

// Import necessary packages
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../utils/custom_service.dart';

// Define AuthService class which extends GetxService for dependency management
// and includes CustomService for custom service methods
class AuthService extends GetxService with CustomService {
  // Set a logTag string for identifying this service in logs
  @override
  String get logTag => 'AuthService';

  // Instance of FirebaseAuth to do all Firebase authentication related operations
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Stream that emits changes in the user authentication status
  Stream<User?> get userChanges => _auth.authStateChanges();

  // Property to get the authentication status of the current user
  User? get user => _auth.currentUser;

  // Method to sign in a user with email and password. It returns a Future that resolves to User object on successful sign in and null if not.
  Future<User?> signIn(String email, String password) async {
    return (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
  }

  // Method to sign up a user with email and password. It returns a Future that
  // resolves to User object on successful sign up and null if sign up fails.
  Future<User?> signUp(String email, String password) async {
    return (await _auth.createUserWithEmailAndPassword(email: email, password: password)).user;
  }

  // Method to sign out the currently authenticated user
  Future<void> signOut() async => await _auth.signOut();

  // Method to recover password using email. Firebase sends a password reset email to the user
  Future<void> recoverPassword(String email) async => await _auth.sendPasswordResetEmail(email: email);
}

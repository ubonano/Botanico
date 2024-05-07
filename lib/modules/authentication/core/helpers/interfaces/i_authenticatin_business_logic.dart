import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthenticationBusinessLogic {
  User? get currentUser;
  String get currentUserId;
  String get currentUserEmail;

  Future<User?> signUp(String email, String password);
  void postSignUp();

  Future<void> signIn(String email, String password);
  Future<void> postSignIn();

  Future<void> signOut();
  void postSignOut();

  Future<void> recoverPassword(String email);
  void postRecoverPassword();
}

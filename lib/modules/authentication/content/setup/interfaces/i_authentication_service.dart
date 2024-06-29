import 'package:firebase_auth/firebase_auth.dart';
export 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthenticationService {
  User? get currentUser;
  Future<void> signUp(String email, String password);
  Future<void> signIn(String email, String password);
  Future<void> signOut();
  Future<void> passwordRecover(String email);
}

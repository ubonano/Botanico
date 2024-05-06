import '../../../module.dart';

abstract class IAuthenticationRepository {
  User? get currentUser;

  Future<User?> signIn(String email, String password);
  Future<User?> signUp(String email, String password);
  Future<void> signOut();
  Future<void> recoverPassword(String email);
}

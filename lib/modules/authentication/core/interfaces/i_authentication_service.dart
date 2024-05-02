abstract class IAuthenticationService {
  Future<void> signUp(String email, String password);
  Future<void> signIn(String email, String password);
  Future<void> signOut();
  Future<void> passwordRecover(String email);
}

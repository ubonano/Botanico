import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:get/get.dart';

class AuthenticationService with GlobalServices {
  late final AuthenticationRepository _authRepo = Get.find();

  Future<void> signUp(String email, String password) async {
    await oprManager.perform(
      operationName: 'Sign up',
      operation: (_) async => await _authRepo.signUp(email, password),
      onSuccess: AuthenticationHandler().postSignUp,
    );
  }

  Future<void> signIn(String email, String password) async {
    await oprManager.perform(
      operationName: 'Sign in',
      operation: (_) async => await _authRepo.signIn(email, password),
      onSuccess: AuthenticationHandler().postSignIn,
    );
  }

  Future<void> signOut() async {
    await oprManager.perform(
      operationName: 'Sign out',
      operation: (_) async => await _authRepo.signOut(),
      onSuccess: AuthenticationHandler().postSignOut,
    );
  }

  Future<void> passwordRecover(String email) async {
    await oprManager.perform(
      operationName: 'Recover password',
      successMessage: 'Se envio un email a tu casilla para restaurar tu contraseña',
      operation: (_) async => await _authRepo.recoverPassword(email),
      onSuccess: AuthenticationHandler().postRecoverPassword,
    );
  }
}

import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:get/get.dart';

class AuthenticationService extends GetxService with GlobalServices implements IAuthenticationService {
  late final IAuthenticationBusinessLogic _authBusinessLogic = Get.find();

  @override
  Future<void> signUp(String email, String password) async {
    await oprManager.perform(
      operationName: 'Sign up',
      operation: (_) async => await _authBusinessLogic.signUp(email, password),
      onSuccess: _authBusinessLogic.postSignUp,
    );
  }

  @override
  Future<void> signIn(String email, String password) async {
    await oprManager.perform(
      operationName: 'Sign in',
      operation: (_) async => await _authBusinessLogic.signIn(email, password),
      onSuccess: _authBusinessLogic.postSignIn,
    );
  }

  @override
  Future<void> signOut() async {
    await oprManager.perform(
      operationName: 'Sign out',
      operation: (_) async => await _authBusinessLogic.signOut(),
      onSuccess: _authBusinessLogic.postSignOut,
    );
  }

  @override
  Future<void> passwordRecover(String email) async {
    await oprManager.perform(
      operationName: 'Recover password',
      successMessage: 'Se envio un email a tu casilla para restaurar tu contraseña',
      operation: (_) async => await _authBusinessLogic.recoverPassword(email),
      onSuccess: _authBusinessLogic.postRecoverPassword,
    );
  }
}

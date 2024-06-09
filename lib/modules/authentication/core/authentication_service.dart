import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

import '../module.dart';

class AuthenticationService extends GetxService with GlobalHelper implements IAuthenticationService {
  late final IAuthenticationBusinessLogic _authBusinessLogic = Get.find();

  @override
  Future<void> signUp(String email, String password) async => await operation.perform(
        operationName: 'Sign up $email',
        operation: (_) async => await _authBusinessLogic.signUp(email, password),
      );

  @override
  Future<void> signIn(String email, String password) async => await operation.perform(
        operationName: 'Sign in $email',
        operation: (_) async => await _authBusinessLogic.signIn(email, password),
      );

  @override
  Future<void> signOut() async => await operation.perform(
        operationName: 'Sign out',
        operation: (_) async => await _authBusinessLogic.signOut(),
      );

  @override
  Future<void> passwordRecover(String email) async => await operation.perform(
        operationName: 'Recover password $email',
        successMessage: 'Se envio un email a tu casilla para restaurar tu contraseña',
        operation: (_) async => await _authBusinessLogic.recoverPassword(email),
      );
}

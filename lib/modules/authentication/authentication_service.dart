import 'package:get/get.dart';

import '../app/content/helpers/global_helper.dart';
import 'setup/interfaces/i_authenticatin_business_logic.dart';
import 'setup/interfaces/i_authentication_service.dart';

class AuthenticationService extends GetxService with GlobalHelper implements IAuthenticationService {
  late final IAuthenticationBusinessLogic _authBusinessLogic = Get.find();

  @override
  User? get currentUser => _authBusinessLogic.currentUser;

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

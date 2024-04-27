import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:get/get.dart';

class PasswordRecoverController extends GetxController
    with FormController, LifeCycleLogging, GlobalServices, AuthContext {
  @override
  String get logTag => 'PasswordRecoverController';

  @override
  List<String> formFields = [FieldKeys.email];

  @override
  Future<void> submit() async {
    await _passwordRecover(getFieldValue(FieldKeys.email));
  }

  Future<void> _passwordRecover(String email) async {
    await oprManager.perform(
      operationName: 'Recover password',
      successMessage: 'Se envio un email a tu casilla para restaurar tu contraseña',
      operation: (_) async => await authRepo.recoverPassword(email),
      onSuccess: navigate.back,
    );
  }
}

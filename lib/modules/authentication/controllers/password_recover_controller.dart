import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

class PasswordRecoverController extends GetxController with FormController, ContextController {
  @override
  String get logTag => 'PasswordRecoverController';

  late final AuthRepository _authRepository = Get.find();

  @override
  List<String> formFields = ['email'];

  @override
  Future<void> submit() async {
    await passwordRecover(
      email: getFieldValue('email'),
      successMessage: 'Se envio un email a tu casilla para restaurar tu contraseña',
      onSuccess: navigate.back,
    );
  }

  Future<void> passwordRecover({
    required String email,
    String successMessage = '',
    required Function() onSuccess,
  }) async {
    await oprManager.perform(
      operationName: 'Recover password',
      successMessage: successMessage,
      operation: (_) async => await _authRepository.recoverPassword(email),
      onSuccess: onSuccess,
    );
  }
}

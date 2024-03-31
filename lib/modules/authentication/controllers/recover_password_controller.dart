import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

class RecoverPasswordController extends GetxController with FormController, ContextController {
  @override
  String get logTag => 'RecoverPasswordController';

  @override
  List<String> formFields = ['email'];

  @override
  Future<void> submit() async {
    await operationManager.perform(
      operationName: 'Recover password',
      successMessage: 'Se envio un email a tu casilla para restaurar tu contraseña',
      operation: (_) => session.recoverPassword(getFieldValue('email')),
      onSuccess: navigate.back,
    );
  }
}

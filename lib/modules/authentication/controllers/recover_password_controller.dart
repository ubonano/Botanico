import 'package:botanico/auxiliaries/auxiliaries.dart';

class RecoverPasswordController extends FormController with LifeCycleLogController, ContextController {
  @override
  String get logTag => 'RecoverPasswordController';

  @override
  List<String> formFields = ['email'];

  void recoverPassword() async {
    await operationManager.perform(
      operationName: 'Recover password',
      successMessage: 'Se envio un email a tu casilla para restaurar tu contraseña',
      operation: (_) => session.recoverPassword(getFieldValue('email')),
      onSuccess: navigate.back,
    );
  }
}

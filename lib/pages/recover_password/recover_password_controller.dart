import '../../utils/form_controller.dart';
import '../../utils/custom_controller.dart';

class RecoverPasswordController extends FormController with CustomController {
  @override
  String get logTag => 'RecoverPasswordController';

  @override
  // ignore: overridden_fields
  List<String> formFields = [
    'email',
  ];

  void recoverPassword() async {
    if (validateForm()) {
      await async.perform(
        operationName: 'Recover password',
        successMessage: 'Se envio un email a tu casilla para restaurar tu contraseña',
        operation: (_) => auth.recoverPassword(
          getFieldValue('email'),
        ),
        onSuccess: navigate.back,
      );
    }
  }
}

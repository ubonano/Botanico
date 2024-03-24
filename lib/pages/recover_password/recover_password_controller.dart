import 'package:get/get.dart';

import '../../controllers/session_controller.dart';
import '../../services/navigation_service.dart';
import '../../utils/async_operation_service.dart';
import '../../controllers/form_controller.dart';
import '../../utils/custom_controller.dart';

class RecoverPasswordController extends FormController with CustomController {
  @override
  String get logTag => 'RecoverPasswordController';

  late final AsyncOperationService _async = Get.find();
  late final SessionController _session = Get.find();
  late final NavigationService navigate = Get.find();

  @override
  List<String> formFields = [
    'email',
  ];

  void recoverPassword() async {
    if (validateForm()) {
      await _async.perform(
        operationName: 'Recover password',
        successMessage: 'Se envio un email a tu casilla para restaurar tu contraseña',
        operation: (_) => _session.recoverPassword(
          getFieldValue('email'),
        ),
        onSuccess: navigate.back,
      );
    }
  }
}

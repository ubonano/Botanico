import 'package:get/get.dart';

import '../../services/session_service.dart';
import '../../../../auxiliaries/services/navigation_service.dart';
import '../../../../auxiliaries/services/async_operation_service.dart';
import '../../../../auxiliaries/form_controller.dart';
import '../../../../auxiliaries/life_cycle_log.dart';

class RecoverPasswordController extends FormController with LifeCycleLogController {
  @override
  String get logTag => 'RecoverPasswordController';

  late final AsyncOperationService _async = Get.find();
  late final SessionService _session = Get.find();
  late final NavigationService _navigate = Get.find();

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
        onSuccess: _navigate.back,
      );
    }
  }
}

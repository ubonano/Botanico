import 'package:get/get.dart';

import '../../services/session_service.dart';
import '../../../../auxiliaries/services/navigation_service.dart';
import '../../../../auxiliaries/services/async_operation_service.dart';
import '../../../../auxiliaries/life_cycle_log.dart';
import '../../../../auxiliaries/form_controller.dart';

class SignUpController extends FormController with LifeCycleLogController {
  @override
  String get logTag => 'SignUpController';

  late final AsyncOperationService _async = Get.find();
  late final SessionService _session = Get.find();
  late final NavigationService _navigate = Get.find();

  @override
  List<String> formFields = [
    'email',
    'password',
    'passwordConfirm',
  ];

  void signUp() async {
    if (validateForm()) {
      await _async.perform(
        operationName: 'Sign up',
        operation: (_) async => await _session.signUp(
          getFieldValue('email'),
          getFieldValue('password'),
        ),
        onSuccess: _navigate.toWorkerCreate,
      );
    }
  }
}

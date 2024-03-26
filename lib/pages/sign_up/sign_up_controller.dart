import 'package:get/get.dart';

import '../../controllers/session_controller.dart';
import '../../services/navigation_service.dart';
import '../../services/async_operation_service.dart';
import '../../utils/life_cycle_log_controller.dart';
import '../../controllers/form_controller.dart';

class SignUpController extends FormController with LifeCycleLogController {
  @override
  String get logTag => 'SignUpController';

  late final AsyncOperationService _async = Get.find();
  late final SessionController _session = Get.find();
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

import 'package:get/get.dart';

import '../../controllers/session_controller.dart';
import '../../services/navigation_service.dart';
import '../../services/async_operation_service.dart';
import '../../utils/life_cycle_log_controller.dart';
import '../../controllers/form_controller.dart';

class SignInController extends FormController with LifeCycleLogController {
  @override
  String get logTag => 'SignInController';

  late final AsyncOperationService _async = Get.find();
  late final SessionController _session = Get.find();
  late final NavigationService _navigate = Get.find();

  @override
  List<String> formFields = [
    'email',
    'password',
  ];

  Future<void> signIn() async {
    if (validateForm()) {
      await _async.perform(
        operationName: 'Sign in',
        operation: (_) async => await _session.signIn(
          getFieldValue('email'),
          getFieldValue('password'),
        ),
        onSuccess: () async {
          await _session.fetchWorker();

          if (_session.workerIsLoaded && _session.companyIsLoaded) _navigate.toHome();
          if (_session.workerIsLoaded && !_session.companyIsLoaded) _navigate.toLobby();
          if (!_session.workerIsLoaded) _navigate.toWorkerCreate();
        },
      );
    }
  }
}

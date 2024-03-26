import 'package:get/get.dart';

import '../../services/session_service.dart';
import '../../../../auxiliaries/services/navigation_service.dart';
import '../../../../auxiliaries/services/async_operation_service.dart';
import '../../../../auxiliaries/life_cycle_log.dart';
import '../../../../auxiliaries/form_controller.dart';

class SignInController extends FormController with LifeCycleLogController {
  @override
  String get logTag => 'SignInController';

  late final AsyncOperationService _async = Get.find();
  late final SessionService _session = Get.find();
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

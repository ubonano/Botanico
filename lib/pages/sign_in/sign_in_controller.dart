import 'package:get/get.dart';

import '../../controllers/session_controller.dart';
import '../../services/navigation_service.dart';
import '../../utils/async_operation_service.dart';
import '../../utils/custom_controller.dart';
import '../../controllers/form_controller.dart';

class SignInController extends FormController with CustomController {
  @override
  String get logTag => 'SignInController';

  late final AsyncOperationService _async = Get.find();
  late final SessionController _session = Get.find();
  late final NavigationService navigate = Get.find();

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

          if (_session.currentWorkerIsLoaded && _session.currentCompanyIsLoaded) navigate.toHome();
          if (_session.currentWorkerIsLoaded && !_session.currentCompanyIsLoaded) navigate.toLobby();
          if (!_session.currentWorkerIsLoaded) navigate.toWorkerCreate();
        },
      );
    }
  }
}

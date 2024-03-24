import '../../utils/custom_controller.dart';
import '../../utils/form_controller.dart';

class SignInController extends FormController with CustomController {
  @override
  String get logTag => 'SignInController';

  @override
  List<String> formFields = [
    'email',
    'password',
  ];

  Future<void> signIn() async {
    if (validateForm()) {
      await async.perform(
        operationName: 'Sign in',
        operation: (_) async => await auth.signIn(
          getFieldValue('email'),
          getFieldValue('password'),
        ),
        onSuccess: () async {
          await fetchWorker();
          if (currentWorkerIsLoaded) await fetchCompany();

          if (currentWorkerIsLoaded && currentCompanyIsLoaded) navigate.toHome();
          if (currentWorkerIsLoaded && !currentCompanyIsLoaded) navigate.toLobby();
          if (!currentWorkerIsLoaded) navigate.toWorkerCreate();
        },
      );
    }
  }
}

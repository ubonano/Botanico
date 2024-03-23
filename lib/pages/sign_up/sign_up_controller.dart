import '../../utils/custom_controller.dart';
import '../../utils/form_controller.dart';

class SignUpController extends FormController with CustomController {
  @override
  String get logTag => 'SignUpController';

  @override
  List<String> formFields = [
    'email',
    'password',
    'passwordConfirm',
  ];

  void signUp() async {
    if (validateForm()) {
      await async.perform(
        operationName: 'Sign up',
        operation: (_) async => await auth.signUp(
          getFieldValue('email'),
          getFieldValue('password'),
        ),
        onSuccess: navigate.toWorkerCreate,
      );
    }
  }
}

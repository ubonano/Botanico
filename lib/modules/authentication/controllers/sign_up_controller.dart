import 'package:botanico/auxiliaries/auxiliaries.dart';

class SignUpController extends FormController with LifeCycleLogController, ContextController {
  @override
  String get logTag => 'SignUpController';

  @override
  List<String> formFields = ['email', 'password', 'passwordConfirm'];

  void signUp() async {
    await operationManager.perform(
      operationName: 'Sign up',
      operation: (_) async => await session.signUp(
        getFieldValue('email'),
        getFieldValue('password'),
      ),
      onSuccess: navigate.toWorkerCreate,
    );
  }
}

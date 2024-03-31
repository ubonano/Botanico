import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController with FormController, ContextController {
  @override
  String get logTag => 'SignUpController';

  @override
  List<String> formFields = ['email', 'password', 'passwordConfirm'];

  @override
  Future<void> submit() async {
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

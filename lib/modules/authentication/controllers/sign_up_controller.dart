import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController with FormController, ContextController {
  @override
  String get logTag => 'SignUpController';

  @override
  List<String> formFields = ['email', 'password', 'passwordConfirm'];

  @override
  Future<void> submit() async {
    await auth.signUp(
      email: getFieldValue('email'),
      password: getFieldValue('password'),
      onSuccess: navigate.toWorkerCreate,
    );
  }
}

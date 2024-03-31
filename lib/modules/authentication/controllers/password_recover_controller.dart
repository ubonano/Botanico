import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

class PasswordRecoverController extends GetxController with FormController, ContextController {
  @override
  String get logTag => 'PasswordRecoverController';

  @override
  List<String> formFields = ['email'];

  @override
  Future<void> submit() async {
    await auth.passwordRecover(
      email: getFieldValue('email'),
      onSuccess: navigate.back,
    );
  }
}

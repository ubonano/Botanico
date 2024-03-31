import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

class SignInController extends GetxController with FormController, ContextController {
  @override
  String get logTag => 'SignInController';

  @override
  List<String> formFields = ['email', 'password'];

  @override
  Future<void> submit() async {
    await auth.signIn(
      email: getFieldValue('email'),
      password: getFieldValue('password'),
      onWorkerLinkedToCompany: navigate.toHome,
      onWorkerNotLinkedToCompany: navigate.toLobby,
      onUserWithoutWorker: navigate.toWorkerCreate,
    );
  }
}

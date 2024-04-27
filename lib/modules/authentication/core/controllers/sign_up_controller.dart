import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController with FormController, LifeCycleLogging, GlobalServices, AuthContext {
  @override
  String get logTag => 'SignUpController';

  @override
  List<String> formFields = [FieldKeys.email, FieldKeys.password, FieldKeys.passwordConfirm];

  @override
  Future<void> submit() async {
    await signUp(
      email: getFieldValue(FieldKeys.email),
      password: getFieldValue(FieldKeys.password),
      onSuccess: navigate.toWorkerCreate,
    );
  }
}

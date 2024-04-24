import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController with FormController, ContextController {
  @override
  String get logTag => 'SignUpController';

  @override
  List<String> formFields = [FieldKeys.email, FieldKeys.password, FieldKeys.passwordConfirm];

  @override
  Future<void> submit() async => await _signUp(
        getFieldValue(FieldKeys.email),
        getFieldValue(FieldKeys.password),
      );

  Future<void> _signUp(String email, String password) async {
    await oprManager.perform(
      operationName: 'Sign up',
      operation: (_) async => await authRepo.signUp(
        getFieldValue(FieldKeys.email),
        getFieldValue(FieldKeys.password),
      ),
      onSuccess: navigate.toWorkerCreate,
    );
  }
}

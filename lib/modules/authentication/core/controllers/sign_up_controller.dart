import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController with UIFormController, LifeCycleLogging {
  @override
  String get logTag => 'SignUpController';

  late final OperationManagerService _oprManager = Get.find();
  late final AuthRepository _authRepo = Get.find();
  late final NavigationService _navigate = Get.find();

  @override
  List<String> formFields = [FieldKeys.email, FieldKeys.password, FieldKeys.passwordConfirm];

  @override
  Future<void> submit() async => await _signUp(
        getFieldValue(FieldKeys.email),
        getFieldValue(FieldKeys.password),
      );

  Future<void> _signUp(String email, String password) async {
    await _oprManager.perform(
      operationName: 'Sign up',
      operation: (_) async => await _authRepo.signUp(
        getFieldValue(FieldKeys.email),
        getFieldValue(FieldKeys.password),
      ),
      onSuccess: _navigate.toWorkerCreate,
    );
  }
}

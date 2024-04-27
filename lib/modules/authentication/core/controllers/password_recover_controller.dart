import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:get/get.dart';

class PasswordRecoverController extends GetxController with FormController, LifeCycleLogging {
  @override
  String get logTag => 'PasswordRecoverController';

  late final OperationManagerService _oprManager = Get.find();
  late final NavigationService _navigate = Get.find();
  late final AuthRepository _authRepository = Get.find();

  @override
  List<String> formFields = [FieldKeys.email];

  @override
  Future<void> submit() async {
    await _passwordRecover(getFieldValue(FieldKeys.email));
  }

  Future<void> _passwordRecover(String email) async {
    await _oprManager.perform(
      operationName: 'Recover password',
      successMessage: 'Se envio un email a tu casilla para restaurar tu contraseña',
      operation: (_) async => await _authRepository.recoverPassword(email),
      onSuccess: _navigate.back,
    );
  }
}

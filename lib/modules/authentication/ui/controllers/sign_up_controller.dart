import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController with FormHelper, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'SignUpController';

  late final IAuthenticationService _authService = Get.find();

  @override
  List<String> formFields = [FieldKeys.email, FieldKeys.password, FieldKeys.passwordConfirm];

  @override
  Future<void> submit() async {
    await _authService.signUp(
      getFieldValue(FieldKeys.email),
      getFieldValue(FieldKeys.password),
    );
  }
}

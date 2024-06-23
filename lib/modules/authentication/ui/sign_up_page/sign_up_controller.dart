import 'package:botanico/modules/company/module.dart';
import 'package:get/get.dart';

import '../../setup/interfaces/i_authentication_service.dart';

class SignUpController extends GetxController with GlobalHelper, FormHelper, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'SignUpController';

  late final IAuthenticationService _authService = Get.find();

  @override
  List<String> formFields = [FieldKeys.email, FieldKeys.password, FieldKeys.passwordConfirm];

  @override
  Future<void> submit() async {
    try {
      await _authService.signUp(
        getFieldValue(FieldKeys.email),
        getFieldValue(FieldKeys.password),
      );

      navigate.toWorkerCreate();
    } catch (e) {
      logTag;
    }
  }
}

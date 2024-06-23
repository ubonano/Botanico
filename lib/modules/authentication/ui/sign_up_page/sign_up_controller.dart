import 'package:get/get.dart';

import '../../../app/setup/fields_key.dart';
import '../../../app/helpers/form_helper.dart';
import '../../../app/setup/global_helper.dart';
import '../../../app/helpers/life_cycle_logging_controller_helper.dart';
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

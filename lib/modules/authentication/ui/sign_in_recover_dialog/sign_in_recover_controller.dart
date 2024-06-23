import 'package:get/get.dart';

import '../../../company/helpers/fields_key.dart';
import '../../../company/helpers/form_helper.dart';
import '../../../company/helpers/global_helper.dart';
import '../../../company/helpers/life_cycle_logging_controller_helper.dart';
import '../../setup/interfaces/i_authentication_service.dart';

class SignInRecoverController extends GetxController with GlobalHelper, FormHelper, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'SignInRecoverController';

  late final IAuthenticationService _authService = Get.find();

  @override
  List<String> formFields = [FieldKeys.email];

  @override
  Future<void> submit() async {
    try {
      await _authService.passwordRecover(getFieldValue(FieldKeys.email));

      navigate.back();
    } catch (e) {
      logTag;
    }
  }
}

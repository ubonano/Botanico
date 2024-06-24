import 'package:get/get.dart';

import '../../../app/content/setup/fields_key.dart';
import '../../../app/content/helpers/form_helper.dart';
import '../../../app/content/helpers/global_helper.dart';
import '../../../app/content/helpers/life_cycle_logging_controller_helper.dart';
import '../../content/setup/interfaces/i_authentication_service.dart';

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

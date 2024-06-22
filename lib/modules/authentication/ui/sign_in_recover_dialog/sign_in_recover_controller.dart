import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

import '../../module.dart';

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

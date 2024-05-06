import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

class PasswordRecoverController extends GetxController with FormHelper, LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'PasswordRecoverController';

  late final IAuthenticationService _authService = Get.find();

  @override
  List<String> formFields = [FieldKeys.email];

  @override
  Future<void> submit() async => await _authService.passwordRecover(getFieldValue(FieldKeys.email));
}

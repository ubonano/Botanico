import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:get/get.dart';

class SignInController extends GetxController with FormController, LifeCycleLogging {
  @override
  String get logTag => 'SignInController';

  late final AuthenticationService _authService = Get.find();

  @override
  List<String> formFields = [FieldKeys.email, FieldKeys.password];

  @override
  Future<void> submit() async {
    await _authService.signIn(
      getFieldValue(FieldKeys.email),
      getFieldValue(FieldKeys.password),
    );
  }
}

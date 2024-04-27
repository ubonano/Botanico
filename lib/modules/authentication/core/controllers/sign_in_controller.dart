import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:get/get.dart';

class SignInController extends GetxController with FormController, LifeCycleLogging, GlobalServices, AuthContext {
  @override
  String get logTag => 'SignInController';

  late final PostSignInService _postSignInService = Get.find();

  @override
  List<String> formFields = [FieldKeys.email, FieldKeys.password];

  @override
  Future<void> submit() async {
    await signIn(
      email: getFieldValue(FieldKeys.email),
      password: getFieldValue(FieldKeys.password),
      onSuccess: _postSignInService.handlePostSignIn,
    );
  }

  @override
  void dispose() {
    Get.delete<PostSignInService>();

    super.dispose();
  }
}

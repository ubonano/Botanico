import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

class SignInController extends GetxController with FormController, ContextController {
  @override
  String get logTag => 'SignInController';

  late final PostSignInService _postSignInService = Get.find();

  @override
  List<String> formFields = [FieldKeys.email, FieldKeys.password];

  @override
  Future<void> submit() async => await _signIn(
        getFieldValue(FieldKeys.email),
        getFieldValue(FieldKeys.password),
      );

  Future<void> _signIn(String email, String password) async {
    await oprManager.perform(
      operationName: 'Sign in',
      operation: (_) async => await authRepo.signIn(email, password),
      onSuccess: _postSignInService.handlePostSignIn,
    );
  }

  @override
  void dispose() {
    Get.delete<PostSignInService>();

    super.dispose();
  }
}

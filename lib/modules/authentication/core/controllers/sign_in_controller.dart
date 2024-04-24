import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:get/get.dart';

class SignInController extends GetxController with UIFormController, LifeCycleLogging {
  @override
  String get logTag => 'SignInController';

  late final OperationManagerService _oprManager = Get.find();
  late final AuthRepository _authRepo = Get.find();
  late final PostSignInService _postSignInService = Get.find();

  @override
  List<String> formFields = [FieldKeys.email, FieldKeys.password];

  @override
  Future<void> submit() async => await _signIn(
        getFieldValue(FieldKeys.email),
        getFieldValue(FieldKeys.password),
      );

  Future<void> _signIn(String email, String password) async {
    await _oprManager.perform(
      operationName: 'Sign in',
      operation: (_) async => await _authRepo.signIn(email, password),
      onSuccess: _postSignInService.handlePostSignIn,
    );
  }

  @override
  void dispose() {
    Get.delete<PostSignInService>();

    super.dispose();
  }
}

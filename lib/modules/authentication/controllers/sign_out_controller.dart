import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

class SignOutController extends GetxController with ContextController {
  @override
  String get logTag => 'SignOutController';

  late final PostSignOutService _postSignOutService = Get.find();

  Future<void> submit() async => await _signOut();

  Future<void> _signOut() async {
    await oprManager.perform(
      operationName: 'Sign out',
      operation: (_) async => await authRepo.signOut(),
      onSuccess: _postSignOutService.handlePostSignOut,
    );
  }

  @override
  void dispose() {
    Get.delete<PostSignOutService>();

    super.dispose();
  }
}

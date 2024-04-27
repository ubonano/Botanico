import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:get/get.dart';

class SignOutController extends GetxController with LifeCycleLogging, GlobalServices, AuthContext {
  @override
  String get logTag => 'SignOutController';

  late final PostSignOutService _postSignOutService = Get.find();

  Future<void> submit() async => await signOut(onSuccess: _postSignOutService.handlePostSignOut);

  @override
  void dispose() {
    Get.delete<PostSignOutService>();

    super.dispose();
  }
}

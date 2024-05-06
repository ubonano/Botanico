import 'package:botanico/modules/authentication/module.dart';
import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

class SignOutController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'SignOutController';

  late final IAuthenticationService _authService = Get.find();

  Future<void> submit() async => await _authService.signOut();
}

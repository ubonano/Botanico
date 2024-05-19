import 'package:botanico/modules/foundation/module.dart';
import 'package:get/get.dart';

import '../../module.dart';

class SignOutController extends GetxController with LifeCycleLoggingControllerHelper {
  @override
  String get logTag => 'SignOutController';

  late final IAuthenticationService _authService = Get.find();

  Future<void> submit() async => await _authService.signOut();
}

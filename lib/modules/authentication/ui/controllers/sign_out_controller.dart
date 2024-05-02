import 'package:botanico/modules/authentication/authentication_module.dart';
import 'package:botanico/modules/foundation/foundation_module.dart';
import 'package:get/get.dart';

class SignOutController extends GetxController with LifeCycleLogging {
  @override
  String get logTag => 'SignOutController';

  late final AuthenticationService _authService = Get.find();

  Future<void> submit() async => await _authService.signOut();
}

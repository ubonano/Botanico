import 'package:botanico/utils/async_operation_service.dart';
import 'package:get/get.dart';
import '../../controllers/session_controller.dart';
import '../../services/navigation_service.dart';
import '../../utils/life_cycle_log_controller.dart';

class SignOutController extends GetxController with LifeCycleLogController {
  @override
  String get logTag => 'SignOutController';

  late final AsyncOperationService _async = Get.find();
  late final SessionController _session = Get.find();
  late final NavigationService _navigate = Get.find();

  Future<void> signOut() async {
    return _async.perform(
      operationName: 'Sign out',
      operation: (_) async => await _session.signOut(),
      onSuccess: _navigate.toSignIn,
    );
  }
}

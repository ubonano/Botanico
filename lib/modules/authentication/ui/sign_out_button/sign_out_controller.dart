import 'package:botanico/auxiliaries/services/async_operation_service.dart';
import 'package:get/get.dart';
import '../../services/session_service.dart';
import '../../../../auxiliaries/services/navigation_service.dart';
import '../../../../auxiliaries/life_cycle_log.dart';

class SignOutController extends GetxController with LifeCycleLogController {
  @override
  String get logTag => 'SignOutController';

  late final AsyncOperationService _async = Get.find();
  late final SessionService _session = Get.find();
  late final NavigationService _navigate = Get.find();

  Future<void> signOut() async {
    return _async.perform(
      operationName: 'Sign out',
      operation: (_) async => await _session.signOut(),
      onSuccess: _navigate.toSignIn,
    );
  }
}

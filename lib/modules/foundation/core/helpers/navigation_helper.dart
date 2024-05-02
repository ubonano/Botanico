import 'package:botanico/setup/routes.dart';
import 'package:get/get.dart';
import 'log_helper.dart';

class NavigationHelper {
  late final LogHelper _log = Get.find();

  void toHome({bool canPop = false}) => to(Routes.HOME, canPop: canPop);
  void toLobby({bool canPop = false}) => to(Routes.LOBBY, canPop: canPop);
  void toSignIn({bool canPop = false}) => to(Routes.SIGN_IN, canPop: canPop);
  void toSignUp({bool canPop = false}) => to(Routes.SIGN_UP, canPop: canPop);
  void toWorkerCreate({bool canPop = false}) => to(Routes.WORKER_CREATE, canPop: canPop);
  void toCompany({bool canPop = false}) => to(Routes.COMPANY_CREATE, canPop: canPop);
  void toWorkerList({bool canPop = false}) => to(Routes.WORKER_LIST, canPop: canPop);
  void toLinkingWorker({bool canPop = false}) => to(Routes.WORKER_LINKING, canPop: canPop);
  void toPermissions(String workerUid, {bool canPop = false}) =>
      to(Routes.WORKER_MANAGEMENT_PERMISSIONS, arguments: workerUid, canPop: canPop);

  void to(String route, {dynamic arguments, bool canPop = false}) {
    if (canPop) {
      _log.debug('Navigate to named: $route');
      Get.toNamed(route, arguments: arguments);
    } else {
      _log.debug('Navigate off all named: $route');
      Get.offAllNamed(route);
    }
  }

  void back() {
    _log.debug('Navigate - back');
    Get.back();
  }
}

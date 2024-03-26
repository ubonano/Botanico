import 'package:botanico/config/routes.dart';
import 'package:get/get.dart';
import 'log_service.dart';

class NavigationService extends GetxService {
  final LogService _log;

  NavigationService({required LogService log}) : _log = log;

  void toHome({bool canPop = false}) => to(Routes.HOME, canPop: canPop);
  void toLobby({bool canPop = false}) => to(Routes.LOBBY, canPop: canPop);
  void toSignIn({bool canPop = false}) => to(Routes.SIGN_IN, canPop: canPop);
  void toSignUp({bool canPop = false}) => to(Routes.SIGN_UP, canPop: canPop);
  void toWorkerCreate({bool canPop = false}) => to(Routes.WORKER_CREATE, canPop: canPop);
  void toCompany({bool canPop = false}) => to(Routes.COMPANY_CREATE, canPop: canPop);
  void toLinkedWorkers({bool canPop = false}) => to(Routes.LINKED_WORKERS, canPop: canPop);
  void toLinkWorker({bool canPop = false}) => to(Routes.LINK_WORKER, canPop: canPop);
  void toPermissions(String workerUid, {bool canPop = false}) =>
      to(Routes.PERMISSIONS, arguments: workerUid, canPop: canPop);

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

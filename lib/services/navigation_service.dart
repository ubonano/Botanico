import 'package:botanico/config/routes.dart';
import 'package:get/get.dart';

import '../utils/log_service.dart';

class NavigationService extends GetxService {
  final log = Get.find<LogService>();

  void toHome({bool canPop = false}) => to(Routes.HOME, canPop: canPop);
  void toLobby({bool canPop = false}) => to(Routes.LOBBY, canPop: canPop);
  void toSignIn({bool canPop = false}) => to(Routes.SIGN_IN, canPop: canPop);
  void toSignUp({bool canPop = false}) => to(Routes.SIGN_UP, canPop: canPop);
  void toWorkerCreate({bool canPop = false}) => to(Routes.WORKER_CREATE, canPop: canPop);
  void toCompany({bool canPop = false}) => to(Routes.COMPANY_CREATE, canPop: canPop);
  void toWorkers({bool canPop = false}) => to(Routes.WORKERS, canPop: canPop);
  void toLinkWorker({bool canPop = false}) => to(Routes.LINK_WORKER, canPop: canPop);

  void to(String route, {bool canPop = false}) {
    if (canPop) {
      log.debug('Navigate to named: $route');
      Get.toNamed(route);
    } else {
      log.debug('Navigate of all named: $route');
      Get.offAllNamed(route);
    }
  }

  void back() {
    log.debug('Navigate - back');
    Get.back();
  }
}

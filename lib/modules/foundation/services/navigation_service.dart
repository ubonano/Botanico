import 'package:botanico/modules/foundation/config/routes.dart';
import 'package:get/get.dart';

import 'loggin_service.dart';

class NavigationService extends GetxService {
  final log = Get.find<LoggingService>();

  void toHome({bool canPop = false}) => to(Routes.HOME, canPop: canPop);
  void toLobby({bool canPop = false}) => to(Routes.LOBBY, canPop: canPop);
  void toSignIn({bool canPop = false}) => to(Routes.SIGN_IN, canPop: canPop);
  void toSignUp({bool canPop = false}) => to(Routes.SIGN_UP, canPop: canPop);
  void toUserProfile({bool canPop = false}) => to(Routes.USER_PROFILE, canPop: canPop);
  void toCompany({bool canPop = false}) => to(Routes.COMPANY_PROFILE, canPop: canPop);

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
